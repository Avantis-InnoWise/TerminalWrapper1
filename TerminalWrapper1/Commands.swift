//
//  ExecutionType.swift
//  TerminalWrapper1
//
//  Created by Николай on 15.02.22.
//

import Foundation

// enum with ExecutionType
enum Commands {
    case bashCommand
    case shellCommand
    
    var rawValue: String {
        switch self {
        case .bashCommand:
            return "/bin/bash"
        case .shellCommand:
            return "/bin/zsh"
        }
    }
}
