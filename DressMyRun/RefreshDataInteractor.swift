//
//  RefreshDataInteractor.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/26/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import PromiseKit

class RefreshDataInteractor: RefreshDataInteracting {
    unowned let wuApiInteractor: WUApiInteracting
    unowned let locationInteractor: LocationInteracting
    unowned let memoryCacheDataStore: MemoryCacheDataStoring

    var isRefreshing = false

    init(wuApiInteractor: WUApiInteracting, locationInteractor: LocationInteracting, memoryCacheDataStore: MemoryCacheDataStoring) {
        self.wuApiInteractor = wuApiInteractor
        self.locationInteractor = locationInteractor
        self.memoryCacheDataStore = memoryCacheDataStore
    }

    func refreshAllData() -> Promise<Void> {
        
        if isRefreshing {
            return Promise(error: RequestError.AlreadyProcessing())
        }
        isRefreshing = true
        
//        wuApiInteractor.fetchForecast()
    }
}
