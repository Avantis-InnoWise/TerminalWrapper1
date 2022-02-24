//
//  TreatmentCommands.swift
//  TerminalWrapper1
//
//  Created by Николай on 15.02.22.
//

import Foundation

final class TreatmentCommands {
    
    // MARK: - Properties
    private let makeUnique = MakeUnique()
    private let errorProcessing = ErrorProcessing()
    private let kw = "Swift"
    
    
    // this function encrypts and decrypts the shell command that you specify in the function
    func implementationCommandB(comand: String) {
        do {
            /* here we call our function and put an argument with shell/bash tool type
               emassage - message encryptio */
            let emessage = makeUnique.unique(text: comand, keyword: kw)
            debugPrint(emessage)
            
            // dmessage - message decryption
            let dmessage = makeUnique.ununique(text: emessage, keyword: kw)
            debugPrint(dmessage)
            
            let output = try errorProcessing.safeСonversion(dmessage, Commands: .commandB)
            // printing cmd output to xcode app console
            print(output)
        } catch {
            print(error) // handle or silence the error here
        }
    }
    
    // this function encrypts and decrypts the bash command that you specify in the function
    func implementationCommandA(comand: String) {
        do {
            // the same thing like previous function call
            let emessage = makeUnique.unique(text: comand, keyword: kw)
            debugPrint(emessage)
            let dmessage = makeUnique.ununique(text: emessage, keyword: kw)
            debugPrint(dmessage)
            let output = try errorProcessing.safeСonversion(dmessage, Commands: .commandA)
            print(output)
        } catch {
            print(error)
        }
    }
}
