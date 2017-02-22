//
//  HomeScreenViewController.swift
//  DressMyRun
//
//  Created by Stephanie on 2/6/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import UIKit

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
}

extension HomeScreenViewController: HomeScreenViewable {
    
}
