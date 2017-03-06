//
//  Helpers.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 3/2/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//


import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

enum RequestMethod {
    case PATCH
    case POST
    case GET
}

enum RequestEncoding {
    case URL
    case JSON
}

extension RequestMethod {
    var alamofireMethod: Alamofire.HTTPMethod {
        switch self {
        case .POST:
            return Alamofire.HTTPMethod.post
        case .GET:
            return Alamofire.HTTPMethod.get
        case .PATCH:
            return Alamofire.HTTPMethod.patch
        }
    }
}

class Request {
    private var alamofireRequest: Alamofire.Request?
    private var errorHelper: ErrorHelper! { return Injector.currentInjector.errorHelper }
    
    var url: String!
    var method: RequestMethod!
    var params: [String: AnyObject]?
    var headers: [String: String]?
    var multipartData: [NSData]?
    
    var isRunning: Bool {
        guard let req = alamofireRequest, let task = req.task else {
            return false
        }
        
        return task.state == .running
    }
    
    func cancel() {
        if let req = alamofireRequest {
            req.cancel()
        }
    }
    
    func json(_ cache: Bool, encoding: RequestEncoding = .URL, asyncCallSourceFile: StaticString = #file, asyncCallSourceLine: Int = #line, asyncCallSourceFunction: StaticString = #function) -> Promise<JSON?> {
        let (promise, fulfill, reject) = Promise<JSON?>.pending()
        
        guard alamofireRequest == nil || !isRunning else {
            reject(RequestError.AlreadyProcessing())
            return promise
        }
        
        guard url != nil && method != nil else {
            reject(RequestError.MissingParameters())
            return promise
        }
        
        // MARK: - Convenience
        
        var request = try! URLRequest(url: url, method: method.alamofireMethod, headers: headers)
        if !cache {
            request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        }
        
        var encodedRequest: URLRequest
        if encoding == .URL {
            encodedRequest = try! URLEncoding.methodDependent.encode(request, with: params)
        } else {
            encodedRequest = try! JSONEncoding.default.encode(request, with: params)
        }
        
        alamofireRequest = Alamofire.request(encodedRequest)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON() { response in
                switch response.result {
                case .success:
                    guard let value = response.result.value else {
                        return fulfill(nil)
                    }
                    
                    fulfill(JSON(value))
                case .failure(let error):
                    var json: JSON?
                    
                    if let data = response.data {
                        json = JSON(data: data)
                    }
                    
                    //TODO fix segmentation fault
                    
                    var displayableError = DisplayableError()
                    
                    let errorSourceFile: StaticString = #file
                    let errorSourceLine: Int = #line
                    let errorSourceFunction: StaticString = #function
                    guard let httpStatusCode = response.response?.statusCode else {
                        return reject(AppError.UnknownError())
                    }
                    
                    if httpStatusCode >= 500 {
                        displayableError = ResponseError.ServerError(backingError: error, userInfo: nil, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
                    }
                    
                    if httpStatusCode == 404 {
                        displayableError = ResponseError.NotFound(backingError: error, userInfo: nil, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
                    }
                    
                    if httpStatusCode == 401 {
                        displayableError = RequestError.Unauthorized(backingError: error, userInfo: nil, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
                    }
                    
                    if httpStatusCode == 400 {
                        if let validationError = ValidationError(json: json, backingError: error, userInfo: nil, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction) {
                            displayableError = validationError
                        } else {
                            displayableError = RequestError.BadRequest(backingError: error, userInfo: nil, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
                        }
                    }
                    
                    reject(displayableError)
                }
        }
        return promise
    }
}
