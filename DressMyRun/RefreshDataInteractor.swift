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
    unowned let appConfigInteractor: AppConfigInteracting
    unowned let memoryCacheDataStore: MemoryCacheDataStoring

    var isRefreshing = false

    init() {

    }

    func refreshAllData() -> Promise<Void> {
        
        if isRefreshing {
            return Promise(error: RequestError.AlreadyProcessing())
        }
        isRefreshing = true
        
        return App
    }
}
