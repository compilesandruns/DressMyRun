//
//  RefreshDataInteracting.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/26/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import PromiseKit

protocol RefreshDataInteracting: class {
    func refreshAllData() -> Promise<Void>
}
