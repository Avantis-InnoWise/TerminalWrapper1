//
//  main.swift
//  TerminalWrapper1
//
//  Created by Николай on 14.02.22.
//

import Foundation

// MARK: - Constant
private let implementationBashShell = ImplementationBashShell()

// specify command for bash
private let comandBash = "pwd"

// specify command for shell
private let comandShell = "cd"

// MARK: - Logic
implementationBashShell.forBash(comand: comandBash)
implementationBashShell.forShell(comand: comandShell)
