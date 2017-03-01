//
//  HomeScreenViewable.swift
//  DressMyRun
//
//  Created by Stephanie on 2/6/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

protocol HomeScreenViewable: class, AlertViewable {
    var conditions: String! { get set }
    var tempurature: String! { get set }
//    var icon: String! { get set }
    var realFeel: String! { get set }
    var windSpeed: String! { get set }
}
