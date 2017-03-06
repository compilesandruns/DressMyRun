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
    }
    class NotFound: DisplayableError {
        override var displayMessage: String { return "Sorry, unable to locate the sorce of your request." }

    }
    class ServerError: DisplayableError {
        override var displayMessage: String { return "Sorry, there's an issue with the server. Please try again." }

    }
}
