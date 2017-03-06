//
//  WURemoteDataStore.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 3/1/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import PromiseKit
import SwiftyJSON

class WURemoteDataStore: WURemoteDataStoring {
    
    func fetchForecast(latitude: String, longitude: String)-> Promise<JSON> {
        return requestFromApi(url:Environment.WU.baseURL + Secrets.WU.apiKey + Environment.WU.conditionsQuery + latitude + "/" + longitude, method: .GET)
    }

    private func requestFromApi(url: String, method: RequestMethod, params: [String: AnyObject]? = nil, encoding: RequestEncoding = .URL, asyncCallSourceFile: StaticString = #file, asyncCallSourceLine: Int = #line, asyncCallSourceFunction: StaticString = #function) -> Promise<JSON> {
        let request = Request()
        
        request.url = url
        request.method = method
        request.params = params
        
        return request.json(false, encoding: encoding, asyncCallSourceFile: asyncCallSourceFile, asyncCallSourceLine: asyncCallSourceLine, asyncCallSourceFunction: asyncCallSourceFunction).then { json -> Promise<JSON> in
            guard let json = json, json != JSON.null && !json.isEmpty else {
                throw ResponseError.MissingResponse(userInfo: ["url": request.url, "params": request.params])
            }
            return Promise(value: json)
        }
    }

}
