//
//  AppConfigInteractor.swift
//  DressMyRun
//
//  Created by Stephanie on 3/6/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import PromiseKit
import SwiftyJSON

class AppConfigInteractor {
    let wuRemoteDataStore: WURemoteDataStoring!
    let localDataStore: JSONKeyValueDataStoring!
    let appConfigRemoteDataStore: AppConfigRemoteDataStoring!
    let memoryCacheDataStore: MemoryCacheDataStoring!
    
    init(wuRemoteDataStore: WURemoteDataStoring, localDataStore: JSONKeyValueDataStoring, appConfigRemoteDataStore: AppConfigRemoteDataStoring, memoryCacheDataStore: MemoryCacheDataStoring) {
        self.wuRemoteDataStore = wuRemoteDataStore
        self.localDataStore = localDataStore
        self.appConfigRemoteDataStore = appConfigRemoteDataStore
        self.memoryCacheDataStore = memoryCacheDataStore
    }
}

extension AppConfigInteractor: AppConfigInteracting {
    
    func fetchAppConfig() -> Promise<Void> {
        let lastSync = localDataStore.get(key: Environment.LocalStorage.lastAppConfigRemoteSyncKey) as? NSDate
        if memoryCacheDataStore.cachedConfig == nil ||
            lastSync?.addingTimeInterval(TimeInterval(Environment.AppConfig.refreshInterval)).compare(Date()) == .orderedAscending {
                    
            self.localDataStore.set(value: NSDate(), key: Environment.LocalStorage.lastAppConfigRemoteSyncKey)

        }
        return Promise(value:())
    }
}
