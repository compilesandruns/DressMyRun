//
//  JSON+Required.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 3/5/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import SwiftyJSON

//MARK: - Errors
let SwiftyExtensionErrorDomain = "Swifty"
let SwiftyExtensionErrorRequired = 400

//MARK: - Throwable Accessors for Required Properties
extension JSON {
    
    public func requiredString() throws -> String {
        guard let value = self.string, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Value is missing or null"])
        }
        
        return value
    }
    
    public func requiredBool() throws -> Bool {
        guard let value = self.bool, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Value is missing or null"])
        }
        
        return value
    }
    
    public func requiredInt() throws -> Int {
        guard let value = self.int, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Value is missing or null"])
        }
        
        return value
    }
    
    public func requiredUInt64() throws -> UInt64 {
        guard let value = self.uInt64, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Value is missing or null"])
        }
        
        return value
    }
    
    public func requiredFloat() throws -> Float {
        guard let value = self.float, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Value is missing or null"])
        }
        
        return value
    }
    
    public func requiredArray() throws -> [JSON] {
        guard let value = self.array, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Value is missing or null"])
        }
        
        return value
    }
    
    public func requiredDictionary() throws -> [String : JSON] {
        guard let value = self.dictionary, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Value is missing or null"])
        }
        
        return value
    }
    
    public func requiredURL() throws -> URL {
        guard let value = self.url, self.type != .null else {
            throw self.error ?? NSError(domain: SwiftyExtensionErrorDomain, code: SwiftyExtensionErrorRequired, userInfo: [NSLocalizedDescriptionKey: "Value is missing or null"])
        }
        
        return value
    }
}
