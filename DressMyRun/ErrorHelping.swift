//
//  ErrorHelping.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/9/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ErrorHelping: class {
    func processServerError(error: Error, httpStatusCode: Int, json: JSON?, userInfo: [String: Any]?, errorSourceFile: StaticString, errorSourceLine: Int, errorSourceFunction: StaticString) -> ErrorDisplaying;
    func processError(error: Error, userInfo: [String: Any]?, errorSourceFile: StaticString, errorSourceLine: Int, errorSourceFunction: StaticString) -> ErrorDisplaying
}
