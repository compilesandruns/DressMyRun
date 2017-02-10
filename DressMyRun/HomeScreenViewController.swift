//
//  HomeScreenViewController.swift
//  DressMyRun
//
//  Created by Stephanie on 2/6/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import UIKit

class HomeScreenViewController: BaseViewController {
    let presenter: HomeScreenPresenting!
    
    @IBOutlet weak var conditionsIcon: UIImageView!
    @IBOutlet weak var tempuratureLabel: UILabel!
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var realFeelLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    init(presenter: HomeScreenPresenting) {
        self.presenter = presenter
    }
    

    
}
