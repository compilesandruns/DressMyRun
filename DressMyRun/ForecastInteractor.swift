//
//  ForecastInteractor.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/28/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

class ForecastInteractor {
    private var lastUpdated: String!
    
    unowned let memoryCacheDataStore: MemoryCacheDataStoring

    init(memoryCacheDataStore: MemoryCacheDataStoring) {
        self.memoryCacheDataStore = memoryCacheDataStore
    }
}

extension ForecastInteractor: ForecastInteracting {
    
}
