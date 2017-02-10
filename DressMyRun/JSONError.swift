//
//  JSONError.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/9/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import Foundation

class JSONError {
    class NullOrEmpty: DisplayableError {
        override var shouldLog: Bool { return true }
    }
    class Invalid: DisplayableError {
        override var shouldLog: Bool { return true }
    }
    class MappingError: DisplayableError {
        override var shouldLog: Bool { return true }
    }
}
