//
//  ResponseError.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/9/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import Foundation
import SwiftyJSON

class ResponseError {
    class MissingResponse: DisplayableError {
        override var displayMessage: String { return "Sorry, an error has occurred. Please try again." }
        override var shouldLog: Bool { return true }
    }
    class NotFound: DisplayableError {
        override var shouldLog: Bool { return true }
    }
    class ServerError: DisplayableError {
        override var shouldLog: Bool { return true }
    }
}
