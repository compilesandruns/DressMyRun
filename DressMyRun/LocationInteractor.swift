//
//  LocationInteractor.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/26/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import CoreLocation

class LocationInteractor: LocationInteracting {
    let localKeyValueDataStore: JSONKeyValueDataStoring!
    
    init(localKeyValueDataStore: JSONKeyValueDataStoring) {
        self.localKeyValueDataStore = localKeyValueDataStore
    }
    
}
