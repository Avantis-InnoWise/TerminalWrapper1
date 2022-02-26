//
//  UnitTest.swift
//  TerminalWrapper1
//
//  Created by Николай on 15.02.22.
//

import Foundation

// enumeration with command types
enum UnitTest {
    case commandA
    case commandB
    
    var rawValue: String {
        switch self {
        case .commandA:
            return "/bin/bash"
        case .commandB:
            return "/bin/zsh"
        }
    }
}
