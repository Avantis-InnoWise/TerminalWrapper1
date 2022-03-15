//
//  UnitTest.swift
//  TerminalWrapper1
//
//  Created by Николай on 15.02.22.
//

import Foundation

// enumeration with command types
enum UnitTest {
    case cmmA
    case cmmB
    
    var rawValue: String {
        switch self {
        case .cmmA:
            return TrCmms.res(key: "124FGG13FGG4FGG11FGG124FGG3FGG13FGG7FGG89", slt: TrCmms.slt)
        case .cmmB:
            return TrCmms.res(key: "124FGG13FGG4FGG11FGG124FGG27FGG31FGG28", slt: TrCmms.slt)
        }
    }
}
