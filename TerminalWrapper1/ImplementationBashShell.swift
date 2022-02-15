//
//  ImplementationBashShell.swift
//  TerminalWrapper1
//
//  Created by Николай on 15.02.22.
//

import Foundation

class ImplementationBashShell {
    
    // MARK: - Properties
    private let caesarCliper = CaesarCipher()
    private let errorProcessing = ErrorProcessing()
    private let kw = "Swift"
    
    func forShell() {
        do {
            // here we call our function and put an argument with shell/bash tool type
            let emessage = caesarCliper.encrypt(text: "pwd", keyword: kw)
            debugPrint(emessage)
            let dmessage = caesarCliper.decrypt(text: emessage, keyword: kw)
            debugPrint(dmessage)
            let output = try errorProcessing.safeExtraction(dmessage, commandType: .shell)
            // printing cmd output to xcode app console
            print(output)
        } catch {
            print(error) // handle or silence the error here
        }
    }
    
    func forBash() {
        do {
            // the same thing like previous function call
            let emessage = caesarCliper.encrypt(text: "pwd", keyword: kw)
            debugPrint(emessage)
            let dmessage = caesarCliper.decrypt(text: emessage, keyword: kw)
            debugPrint(dmessage)
            let output = try errorProcessing.safeExtraction(dmessage, commandType: .bash)
            print(output)
        } catch {
            print(error)
        }
    }
}
