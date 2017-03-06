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
            
            return Forecast(conditions: try json["current_observation"].requiredInt(),
                            tempF: try json["temp_f"].requiredInt(),
                            tempC: try json["temp_c"].requiredInt(),
                            realFeelF: try json["feelslike_f"].requiredInt(),
                            realFeelC: try json["feelslike_c"].requiredInt(),
                            windSpeedM: try json["wind_mph"].requiredInt(),
                            windSpeedK: try json["wind_kph"].requiredInt(),
                            lastUpdated: try json["last_updated"].requiredString())
            
        } catch {
            throw JSONError.MappingError(backingError: error)
        }
    }
}
