//
//  RefreshDataInteractor.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/26/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import PromiseKit

class RefreshDataInteractor {
    var isRefreshing = false

    init() {
        
    }
}

extension RefreshDataInteractor: RefreshDataInteracting {
    
    
    
    func refreshAllData() -> Promise<Void> {
        return Promise(value:())
    }
}
