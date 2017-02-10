//
//  Injector.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/9/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

class Injector {
    var errorHelper: ErrorHelper!
    
    private static var defaultInjector: Injector!
    
    static var currentInjector: Injector {
        return defaultInjector
    }
    
    init() {
        errorHelper = ErrorHelper()
    }
    
    func homeScreenPresenter(view: HomeScreenViewable) -> HomeScreenPresenter {
        return HomeScreenPresenter(view: view)
    }
}
