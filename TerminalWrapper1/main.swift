//
//  main.swift
//  TerminalWrapper1
//
//  Created by Николай on 14.02.22.
//

import Foundation

// MARK: - Constant
private let implementationBashShell = ImplementationBashShell()
private let comand = "pwd"

// MARK: - Logic
implementationBashShell.forBash(comand: comand)
implementationBashShell.forShell(comand: comand)
