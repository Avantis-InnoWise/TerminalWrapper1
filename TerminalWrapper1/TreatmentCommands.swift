//
//  TrCmms.swift
//  TerminalWrapper1
//
//  Created by Николай on 15.02.22.
//

import Foundation

enum TrCmms {
    static let slt = "SomeSalt123456dgsdgqg" // Is a salt. We use it to mix with our original string.
    static var sep = "FGG" // Is a separator. We use it to create string from array of numbers (UTF8), and separate encrypted string to original.

    // !!! We have to use the same salt and separator to encrypt and decrypt. If we change the parameter we should

    // encrypting the string that we pass to the method
    static func show(str: String, slt: String) -> String {
        let txt = [UInt8](str.utf8) // original text in utf8
        let cpr = [UInt8](slt.utf8) // salt in utf8
        var ecd = [UInt8]()
        for t in txt.enumerated() {
            ecd.append(t.element ^ cpr[t.offset % cpr.count]) // mix original string and salt
        }
        return ecd.map { String($0) }.joined(separator: TrCmms.sep) // create string from array of numbers with separator
    }

    static func res(key: String, slt: String) -> String {
        let cpr = [UInt8](slt.utf8) // salt in utf8
        var dcd = [UInt8]()
        for k in key.components(separatedBy: TrCmms.sep).map({ UInt8($0) ?? 0 }).enumerated() {
            dcd.append(k.element ^ cpr[k.offset % cpr.count])
        } // decrypt original string
        return String(bytes: dcd, encoding: .utf8) ?? ""
    }

}
