//
//  ExecutionType.swift
//  TerminalWrapper1
//
//  Created by Николай on 15.02.22.
//

import Foundation

// enum with ExecutionType
enum ExecutionType {
    case bash
    case shell
    
    var rawValue: String {
        switch self {
        case .bash:
            return "/bin/bash"
        case .shell:
            return "/bin/zsh"
        }
    }
}
