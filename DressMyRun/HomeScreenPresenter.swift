//
//  HomeScreenPresenter.swift
//  DressMyRun
//
//  Created by Stephanie on 2/6/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

class HomeScreenPresenter {
    unowned let view: HomeScreenViewable
    unowned let refreshDataInteractor: RefreshDataInteracting
    unowned let forecastInteractor: ForecastInteracting
    
    init(view: HomeScreenViewable, refreshDataInteractor: RefreshDataInteracting, forecastInteractor: ForecastInteracting) {
        self.view = view
        self.refreshDataInteractor = refreshDataInteractor
        self.forecastInteractor = forecastInteractor
    }
    
    func viewWillAppear() {
        refreshData()
    }
}

extension HomeScreenPresenter: HomeScreenPresenting {
    
    func refreshData() {
        refreshDataInteractor.refreshAllData().then { _ -> Void in
//            if let forecast = memoryCacheDataStore.cachedForecast {
//                self.view.unableToUpdateAlert()
//            }
            self.view.conditions = forecastInteractor.currentForecast.conditions
            self.view.realFeel = forecastInteractor.currentForecast.realFeel
            self.view.tempurature = forecastInteractor.currentForecast.tempurature
            self.view.windSpeed = forecastInteractor.currentForecast.windSpeed
        }
    }
}
