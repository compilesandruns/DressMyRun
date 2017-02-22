//
//  Injector.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/9/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

class Injector {
    var errorHelper: ErrorHelper!
    
    private static var injector: Injector!
    
    static var currentInjector: Injector {
        return injector
    }
    
    static func setInjector(injector: Injector) {
        self.injector = injector
    }
    
    init() {
        errorHelper = ErrorHelper()
    }
    
    func homeScreenPresenter(view: HomeScreenViewable) -> HomeScreenPresenter {
        return HomeScreenPresenter(view: view)
    }
}