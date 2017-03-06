//
//  MemoryCacheDataStore.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/26/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//
import SwiftyJSON

class MemoryCacheDataStore {
    var cachedConfig: JSON?
    var cachedForecast: Forecast!
}

extension MemoryCacheDataStore: MemoryCacheDataStoring {
    func clear() {
        cachedForecast = nil
    }
}
