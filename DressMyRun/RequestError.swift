//
//  RequestError.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/9/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//


import Foundation

class RequestError {
    class MissingParameters: DisplayableError {
        override var shouldLog: Bool { return true }
    }
    class Unauthorized: DisplayableError {
        override var shouldLog: Bool { return true }
    }
    class BadRequest: DisplayableError {
        override var shouldLog: Bool { return true }
    }
}

extension RequestError {
    class TimedOut: DisplayableError {
        override var displayTitle: String { return "Timed Out" }
    }
}

extension RequestError {
    class NoNetworkConnection: DisplayableError {
        override var displayTitle: String { return "No Network Connection" }
        override var displayMessage: String { return "Please check your internet connection and try again." }
    }
}

extension RequestError {
    class AlreadyProcessing: DisplayableError {
        override var displayTitle: String { return "Already Processing" }
        override var displayMessage: String { return "Please try again in a little bit." }
    }
}

extension RequestError {
    class Cancelled: DisplayableError {
        override var displayTitle: String { return "Processing Cancelled" }
        override var displayMessage: String { return "Please try again." }
    }
}
