//
//  HomeScreenPresenter.swift
//  DressMyRun
//
//  Created by Stephanie on 2/6/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

class HomeScreenPresenter {
    unowned let view: HomeScreenViewable
    unowned let forecastInteractor: ForecastInteracting
    unowned let refreshDataInteractor: RefreshDataInteracting
    unowned let memoryCacheDataStore: MemoryCacheDataStoring
    
    init(view: HomeScreenViewable, forecastInteractor: ForecastInteracting, refreshDataInteractor: RefreshDataInteracting, memoryCacheDataStore: MemoryCacheDataStoring) {
        self.view = view
        self.forecastInteractor = forecastInteractor
        self.refreshDataInteractor = refreshDataInteractor
        self.memoryCacheDataStore = memoryCacheDataStore
    }
    
    func viewWillAppear() {
        refreshData()
    }
}

extension HomeScreenPresenter: HomeScreenPresenting {
    
    func refreshData() {
        _ = refreshDataInteractor.refreshAllData()
            .then { _ -> Void in
                if let forecast = self.memoryCacheDataStore.cachedForecast {
                    _ = self.view.showAlert(message: "Please try again later.", title: "Unable to update")
                }
                self.view.conditions = forecastInteractor.currentForecast.conditions
                self.view.realFeel = forecastInteractor.currentForecast.realFeel
                self.view.tempurature = forecastInteractor.currentForecast.tempurature
                self.view.windSpeed = forecastInteractor.currentForecast.windSpeed
            }
    }
}
