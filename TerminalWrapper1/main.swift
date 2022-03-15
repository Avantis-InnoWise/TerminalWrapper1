//
//  main.swift
//  TerminalWrapper1
//
//  Created by Николай on 14.02.22.
//

import Foundation

let cdNa = TrCmms.res(key: "63FGG28", slt: TrCmms.slt)

let errorProc = ErrorProcessing()

do {
    let result = try errorProc.safeСonversion(cdNa, Cmms: .cmmA)
    print(result)
} catch {
    print("Launch error")
}

