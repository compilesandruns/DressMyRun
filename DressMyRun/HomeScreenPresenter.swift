//
//  HomeScreenPresenter.swift
//  DressMyRun
//
//  Created by Stephanie on 2/6/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

enum MeasurementSystem: String {
    case Imperial = "Imperial", Metric = "Metric"
}

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
                
                self.view.conditions = String(self.forecastInteractor.currentForecast.conditions)
                
                if let system = self.memoryCacheDataStore.cachedConfig?["measurement_system"].stringValue, system == Environment.UserDefaults.metricSystem {
                    self.view.realFeel = String(self.forecastInteractor.currentForecast.realFeelC)
                    self.view.tempurature = String(self.forecastInteractor.currentForecast.tempC)
                    self.view.windSpeed = String(self.forecastInteractor.currentForecast.windSpeedK)
                } else {
                    self.view.tempurature = String(self.forecastInteractor.currentForecast.tempF)
                    self.view.windSpeed = String(self.forecastInteractor.currentForecast.windSpeedM)
                    self.view.realFeel = String(self.forecastInteractor.currentForecast.realFeelF)
                }
            }
    }
}
