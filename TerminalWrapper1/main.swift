//
//  main.swift
//  TerminalWrapper1
//
//  Created by Николай on 14.02.22.
//

import Foundation

let commandName = TreatmentCommands.res(key: "63FGG28", slt: TreatmentCommands.slt)

let errorProc = ErrorProcessing()

do {
    let result = try errorProc.safeСonversion(commandName, Commands: .commandA)
    print(result)
} catch {
    print("Launch error")
}

