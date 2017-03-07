//
//  WUApiInteracting.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 3/1/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import PromiseKit

protocol WUApiInteracting: class {
    func fetchForecast(latitude: String, longitude: String) -> Promise<Forecast>
}
