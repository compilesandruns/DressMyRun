//
//  Forecast.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/26/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import SwiftyJSON

struct Forecast {
    var conditions: Int!
    var tempF: Int!
    var tempC: Int!
    //    var icon: String! { get set }
    var realFeelF: Int!
    var realFeelC: Int!
    var windSpeedM: Int!
    var windSpeedK: Int!
    var lastUpdated: String!
}

extension Forecast {
    static func fromJSON(json: JSON) throws -> Forecast {
        do {
            _ = json.dictionaryValue
            
            return Forecast(conditions: json["current_observation"].intValue,
                            tempF: json["temp_f"].intValue,
                            tempC: json["temp_c"].intValue,
                            realFeelF: json["feelslike_f"].intValue,
                            realFeelC: json["feelslike_c"].intValue,
                            windSpeedM: json["wind_mph"].intValue,
                            windSpeedK: json["wind_kph"].intValue,
                            lastUpdated: json["last_updated"].stringValue)
            
        } catch {
            throw JSONError.MappingError(backingError: error)
        }
    }
}
