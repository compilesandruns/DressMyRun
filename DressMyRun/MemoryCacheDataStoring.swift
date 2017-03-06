//
//  MemoryCacheDataStoring.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/26/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import SwiftyJSON

protocol MemoryCacheDataStoring: class {
    var cachedConfig: JSON? { get set }
    
    var cachedForecast: Forecast! { get set }
    
    func clear()
}
