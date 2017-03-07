//
//  Environment.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/26/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

struct Environment {
    
    struct AppConfig {
        static let refreshInterval = 600
    }
    
    struct WU {
        static let baseURL = "http://api.wunderground.com/api/"
        static let conditionsQuery = "/conditions/q/"
    }
    
    struct LocalStorage {
        static var lastAppConfigRemoteSyncKey = "com.legalshield.localstorage.dressmyrun.lastAppConfigRemoteSyncKey"
        static var appConfigKey = "com.legalshield.localstorage.dressmyrun.appConfig"

    }
    
    struct UserDefaults {
        static let metricSystem = "metric"
        static let imperialSystem = "imperial"
    }
    
    struct GlobalResponseErrorHandler {
        static let notification = "com.dressmyrun.notification.globalresponse.notification"
        static let error = "com.dressmyrun.notification.globalresponse.error"
    }
}
