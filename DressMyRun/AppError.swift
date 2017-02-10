//
//  AppError.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/9/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import Foundation

class AppError {
    class UnknownError: DisplayableError { override var shouldLog: Bool { return true } }
    class PKPassError: DisplayableError {
        override var shouldLog: Bool { return true }
        override var displayMessage: String { return "Sorry, there was an error generating your Membership Card. Please try again later." }
    }
}
