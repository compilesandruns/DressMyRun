//
//  HomeScreenViewController.swift
//  DressMyRun
//
//  Created by Stephanie on 2/6/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import UIKit
import CoreLocation

class HomeScreenViewController: BaseViewController {
    var presenter: HomeScreenPresenting!
    
    @IBOutlet weak var conditionsIcon: UIImageView!
    @IBOutlet weak var tempuratureLabel: UILabel!
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var realFeelLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = Injector.currentInjector.homeScreenPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppear()
    }
}

extension HomeScreenViewController: HomeScreenViewable {
    
    var conditions: String! {
        set {
            conditionsLabel.text = newValue
        }
        get {
            return conditionsLabel.text
        }
    }
    var tempurature: String! {
        set {
            tempuratureLabel.text = newValue
        }
        get {
            return tempuratureLabel.text
        }
    }    //    var icon: String! { get set }
    var realFeel: String! {
        set {
            realFeelLabel.text = newValue
        }
        get {
            return realFeelLabel.text
        }
    }
    var windSpeed: String! {
        set {
            windSpeedLabel.text = newValue
        }
        get {
            return windSpeedLabel.text
        }
    }
}
