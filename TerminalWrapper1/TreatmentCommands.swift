//
//  TreatmentCommands.swift
//  TerminalWrapper1
//
//  Created by Николай on 15.02.22.
//

import Foundation

enum TreatmentCommands {
    static let slt = "SomeSalt123456dgsdgqg"
    static var sep = "FGG"

    static func mix(str: String, slt: String) -> String {
        let txt = [UInt8](str.utf8)
        let cpr = [UInt8](slt.utf8)
        var ecd = [UInt8]()
        for t in txt.enumerated() {
            ecd.append(t.element ^ cpr[t.offset % cpr.count])
        }
        return ecd.map { String($0) }.joined(separator: TreatmentCommands.sep)
    }

    static func res(key: String, slt: String) -> String {
        let cpr = [UInt8](slt.utf8)
        var dcd = [UInt8]()
        for k in key.components(separatedBy: TreatmentCommands.sep).map({ UInt8($0) ?? 0 }).enumerated() {
            dcd.append(k.element ^ cpr[k.offset % cpr.count])
        }
        return String(bytes: dcd, encoding: .utf8) ?? ""
    }

}


