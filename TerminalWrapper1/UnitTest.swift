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
            return TreatmentCommands.res(key: "124FGG13FGG4FGG11FGG124FGG3FGG13FGG7FGG89", slt: TreatmentCommands.slt)
        case .commandB:
            return TreatmentCommands.res(key: "124FGG13FGG4FGG11FGG124FGG27FGG31FGG28", slt: TreatmentCommands.slt)
        }
    }
}
