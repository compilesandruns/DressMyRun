//
//  Injector.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/9/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

class Injector {
    var errorHelper: ErrorHelper!
    
    var refreshDataInteractor: RefreshDataInteracting!
    var forecastInteractor: ForecastInteracting!
    var locationInteractor: LocationInteracting!
    var wuApiInteractor: WUApiInteracting!
    
    var memoryCacheDataStore: MemoryCacheDataStoring!
    var wuRemoteDataStore: WURemoteDataStoring!
    var localKeyValueDataStore: JSONKeyValueDataStoring!
    
    private static var injector: Injector!
    
    static var currentInjector: Injector {
        return injector
    }
    
    static func setInjector(injector: Injector) {
        self.injector = injector
    }
    
    init() {
        errorHelper = ErrorHelper()

        memoryCacheDataStore = MemoryCacheDataStore()
        wuRemoteDataStore = WURemoteDataStore()
        localKeyValueDataStore = LocalKeyValueDataStore()
        
        wuApiInteractor = WUApiInteractor(wuRemoteDataStore: wuRemoteDataStore, memoryCacheDataStore: memoryCacheDataStore)
        locationInteractor = LocationInteractor(localKeyValueDataStore: localKeyValueDataStore)
        forecastInteractor = ForecastInteractor(memoryCacheDataStore: memoryCacheDataStore)
        refreshDataInteractor = RefreshDataInteractor(wuApiInteractor: wuApiInteractor, locationInteractor: locationInteractor, memoryCacheDataStore: memoryCacheDataStore)
    }
    
    func homeScreenPresenter(view: HomeScreenViewable) -> HomeScreenPresenter {
        return HomeScreenPresenter(view: view, forecastInteractor: forecastInteractor, refreshDataInteractor: refreshDataInteractor, memoryCacheDataStore: memoryCacheDataStore)
    }
}
