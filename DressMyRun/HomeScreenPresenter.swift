//
//  HomeScreenPresenter.swift
//  DressMyRun
//
//  Created by Stephanie on 2/6/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

class HomeScreenPresenter: HomeScreenPresenting {
    unowned let view: HomeScreenViewable
    
    init(view:HomeScreenViewable) {
        self.view = view
    }
}
