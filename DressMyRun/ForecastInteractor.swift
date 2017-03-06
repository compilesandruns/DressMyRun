//
//  ForecastInteractor.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/28/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

class ForecastInteractor: ForecastInteracting {
    private var lastUpdated: String?
    
    unowned let memoryCacheDataStore: MemoryCacheDataStoring

    init(memoryCacheDataStore: MemoryCacheDataStoring) {
        self.memoryCacheDataStore = memoryCacheDataStore
    }
    var currentForecast: Forecast! {
        
        guard let lastUpdated = lastUpdated else {
            return memoryCacheDataStore.cachedForecast
        }
        
        guard let forecast = memoryCacheDataStore.cachedForecast, forecast.lastUpdated == lastUpdated else {
            return memoryCacheDataStore.cachedForecast
        }
        return forecast
    }
    
    func setLastUpdated(updated: String) {
        lastUpdated = updated
    }
}
