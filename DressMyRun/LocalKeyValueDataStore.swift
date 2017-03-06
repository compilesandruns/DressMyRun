//
//  JSONKeyValueDataStore.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 3/1/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import Foundation
import SwiftyJSON

class LocalKeyValueDataStore: JSONKeyValueDataStoring {
    let userDefaults = UserDefaults.standard
    
    //MARK: JSONKeyValueDataStoring
    func setJSON(json: JSON, key: String) {
        if let data = try? JSONSerialization.data(withJSONObject: json.object, options: JSONSerialization.WritingOptions(rawValue: 0)) {
            self.userDefaults.set(data, forKey: key)
        }
    }
    
    func getJSON(key: String) -> JSON? {
        guard let data = userDefaults.object(forKey: key) as? NSData else {
            return nil
        }
        
        return JSON(data: data as Data)
    }
    
    //MARK: KeyValueDataStoring
    func set(value: AnyObject, key: String) {
        userDefaults.set(value, forKey: key)
    }
    
    func get(key: String) -> Any? {
        return userDefaults.object(forKey: key)
    }
    
    func delete(key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
