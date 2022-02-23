//
//  main.swift
//  TerminalWrapper1
//
//  Created by Николай on 14.02.22.
//

import Foundation

// MARK: - Constant
private let treatmentCommands = TreatmentCommands()

// specify command for bash
private let comandBash = "curl --retry 5 -f \"https://client-products-test.s3.amazonaws.com/TestAgent.zip\" -o \"/tmp/TestAgent.zip\""

// specify command for shell
private let comandShell = "ls"

// MARK: - Logic
treatmentCommands.implementationBashСommand(comand: comandBash)
treatmentCommands.implementationShellСommand(comand: comandShell)
