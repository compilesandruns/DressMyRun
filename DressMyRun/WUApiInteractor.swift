//
//  WUApiInteractor.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 3/1/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import PromiseKit
import SwiftyJSON

class WUApiInteractor {
    unowned let wuRemoteDataStore: WURemoteDataStoring
    unowned let memoryCacheDataStore: MemoryCacheDataStoring
    
    init(wuRemoteDataStore: WURemoteDataStoring, memoryCacheDataStore: MemoryCacheDataStoring) {
        self.wuRemoteDataStore = wuRemoteDataStore
        self.memoryCacheDataStore = memoryCacheDataStore
    }
}

extension WUApiInteractor: WUApiInteracting {
    
    //MARK: Data
    func fetchForecast(latitude: String, longitude: String) -> Promise<Forecast> {
        return wuRemoteDataStore.fetchForecast(latitude: latitude, longitude: longitude)
            .then() { forecastJSON -> Promise<Forecast> in
                let forecast = try Forecast.fromJSON(json: forecastJSON)
            
                self.memoryCacheDataStore.cachedForecast = forecast
                return Promise(value: forecast)
            }
    }
}
