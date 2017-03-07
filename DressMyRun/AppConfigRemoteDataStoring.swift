//
//  AppConfigRemoteDataStoring.swift
//  DressMyRun
//
//  Created by Stephanie on 3/6/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import PromiseKit
import SwiftyJSON

protocol AppConfigRemoteDataStoring: class {
    func fetchAppConfig() -> Promise<JSON>
}
