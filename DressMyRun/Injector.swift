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
    
    var memoryCacheDataStore: MemoryCacheDataStoring!
    var wuRemoteDataStore: WURemoteDataStoring!
    
    private static var injector: Injector!
    
    static var currentInjector: Injector {
        return injector
    }
    
    static func setInjector(injector: Injector) {
        self.injector = injector
    }
    
    init() {
        errorHelper = ErrorHelper()
        refreshDataInteractor = RefreshDataInteractor()
        
        memoryCacheDataStore = MemoryCacheDataStore()
        wuRemoteDataStore = WURemoteDataStore()
        
        forecastInteractor = ForecastInteractor(memoryCacheDataStore: memoryCacheDataStore)
    }
    
    func homeScreenPresenter(view: HomeScreenViewable) -> HomeScreenPresenter {
        return HomeScreenPresenter(view: view, forecastInteractor: forecastInteractor, refreshDataInteractor: refreshDataInteractor, memoryCacheDataStore: memoryCacheDataStore)
    }
}
