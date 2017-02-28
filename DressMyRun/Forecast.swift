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
}

extension Forecast {
    static func fromJSON(json: JSON) throws -> Forecast {
        do {
            _ = try json.dictionaryValue
            
            return Forecast(conditions: try json["current_observation"].intValue,
                            tempF: try json["temp_f"].intValue,
                            tempC: try json["temp_c"].intValue,
                            realFeelF: try json["feelslike_f"].intValue,
                            realFeelC: try json["feelslike_c"].intValue,
                            windSpeedM: try json["wind_mph"].intValue,
                            windSpeedK: try json["wind_kph"].intValue)
            
        } catch {
            throw JSONError.MappingError(backingError: error)
        }
    }
}
