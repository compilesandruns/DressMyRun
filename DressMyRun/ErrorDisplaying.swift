//
//  ErrorDisplaying.swift
//  DressMyRun
//
//  Created by Stephanie Guevara on 2/9/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import Foundation

protocol ErrorDisplaying: class, Error, CustomStringConvertible, CustomDebugStringConvertible {
    var errorName: String { get }
    var displayTitle: String { get }
    var displayMessage: String { get }
}

//MARK: - Debugging
extension ErrorDisplaying {
    var description: String {
        return "\(displayTitle): \(displayMessage)"
    }
    
    var debugDescription: String {
        let className = ("\(Mirror(reflecting: self).subjectType)")
        
        return "{\"\(displayTitle)\"(\(className)): \(self.displayMessage)}"
    }
}
