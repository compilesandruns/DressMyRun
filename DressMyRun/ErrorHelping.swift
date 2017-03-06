//
//  ErrorHelping.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 3/5/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ErrorHelping {
    func processServerError(_ error: Error, httpStatusCode: Int, json: JSON?, userInfo: [String: Any]?, errorSourceFile: StaticString, errorSourceLine: Int, errorSourceFunction: StaticString) -> ErrorDisplaying;
    func processError(_ error: Error, userInfo: [String: Any]?, errorSourceFile: StaticString, errorSourceLine: Int, errorSourceFunction: StaticString) -> ErrorDisplaying
}
