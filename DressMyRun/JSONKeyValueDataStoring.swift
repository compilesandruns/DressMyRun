//
//  JSONKeyValueDataStoring.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 3/1/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import SwiftyJSON

protocol JSONKeyValueDataStoring: KeyValueDataStoring {
    func setJSON(json: JSON, key: String)
    func getJSON(key: String) -> JSON?
}
