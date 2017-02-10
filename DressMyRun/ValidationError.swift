//
//  ValidationError.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/9/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import Foundation
import SwiftyJSON

class ValidationError: DisplayableError {
    private(set) var errors = [String]()
    
    init(errors: [String], userInfo: [String: Any]? = nil, errorSourceFile: StaticString = #file, errorSourceLine: Int = #line, errorSourceFunction: StaticString = #function) {
        self.errors = errors
        
        super.init(backingError: nil, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
    }
    
    init?(json: JSON?, backingError: Error? = nil, userInfo: [String: Any]? = nil, errorSourceFile: StaticString = #file, errorSourceLine: Int = #line, errorSourceFunction: StaticString = #function) {
        guard let jsonObj = json, let errorDict = jsonObj.dictionary, jsonObj != JSON.null && !jsonObj.isEmpty else {
            return nil
        }
        
        for (key, values) in errorDict {
            guard let values = values.array else {
                continue
            }
            for value in values {
                guard let value = value.string else {
                    continue
                }
                let errorName = key.components(separatedBy:"_").joined(separator:" ")
                
                errors.append("\(errorName) \(value).")
            }
        }
        
        guard errors.count > 0 else {
            return nil
        }
        
        super.init(backingError: backingError, userInfo: userInfo, errorSourceFile: errorSourceFile, errorSourceLine: errorSourceLine, errorSourceFunction: errorSourceFunction)
    }
    
    override var displayMessage: String {
        return errors.map({ (err) -> String in err.capitalized }).joined(separator: "\n")
    }
    
    override var displayTitle: String { return "Please fix the following:" }
}
