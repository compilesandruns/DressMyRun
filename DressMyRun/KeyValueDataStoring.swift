//
//  KeyValueDataStoring.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 3/1/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

protocol KeyValueDataStoring: class {
    func set(value: AnyObject, key: String)
    func get(key: String) -> Any?
    func delete(key: String)
}
