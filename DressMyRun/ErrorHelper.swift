//
//  ErrorHelper.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 3/5/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import Foundation
import SwiftyJSON

class ErrorHelper: DisplayableError {
    
    func processServerError(_ error: Error, httpStatusCode: Int, json: JSON? = nil, userInfo: [String: Any]?, errorSourceFile: StaticString = #file, errorSourceLine: Int = #line, errorSourceFunction: StaticString = #function) -> DisplayableError {
        if httpStatusCode >= 500 {
            return ResponseError.ServerError(backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
        }
        
        if httpStatusCode == 404 {
            return ResponseError.NotFound(backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
        }
        
        if httpStatusCode == 401 {
            return RequestError.Unauthorized(backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
        }
        
        if httpStatusCode == 400 {
            if let validationError = ValidationError(json: json, backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction) {
                return validationError
            } else {
                return RequestError.BadRequest(backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
            }
        }
        
        return processError(error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
    }
    
    func processError(_ error: Error, userInfo: [String: Any]? = nil, errorSourceFile: StaticString = #file, errorSourceLine: Int = #line, errorSourceFunction: StaticString = #function) -> DisplayableError {
        if let err = error as? DisplayableError {
            if err.userInfo == nil {
                err.userInfo = [String: Any]()
            }
            err.userInfo!["supplementary-user-info"] = userInfo
            
            return err
        }
        
        if let err = error as? DisplayableError {
            return err
        }
        
        //Handle NSURLErrorDomain Errors
        let err = error as NSError
        if err.domain == NSURLErrorDomain {
            switch err.code {
            case NSURLErrorCancelled:
                return RequestError.Cancelled(backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
                
            case NSURLErrorTimedOut:
                return RequestError.TimedOut(backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
                
            case NSURLErrorNotConnectedToInternet,
                 NSURLErrorNetworkConnectionLost:
                return RequestError.NoNetworkConnection(backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
                
            case NSURLErrorUserCancelledAuthentication,
                 NSURLErrorUserAuthenticationRequired:
                return RequestError.Unauthorized(backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
                
            default:
                return AppError.UnknownError(backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
            }
        } else if err.domain == NSCocoaErrorDomain {
            switch err.code {
            case 3840: //Invalid JSON Code from Cocoa
                return JSONError.Invalid(backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
            default:
                return AppError.UnknownError(backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
            }
        }
        
        return AppError.UnknownError(backingError: error, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
    }
}
