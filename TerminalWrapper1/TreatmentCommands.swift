//
//  TreatmentCommands.swift
//  TerminalWrapper1
//
//  Created by Николай on 15.02.22.
//

import Foundation
import CryptoKit

final class TreatmentCommands {
    
    // MARK: - Properties
//    private let makeUnique = MakeUnique()
    private let errorProcessing = ErrorProcessing()
    
    
//     this function encrypts and decrypts the shell command that you specify in the function
    func implementationCommandB(comand: String) {
        do {
            let messageData = comand.data(using: .utf8)! // mark 1
                    let symmetricKey = CryptoKit.SymmetricKey.init(size: .bits256) // mark 2
                    print("Symmetric Key -> \(symmetricKey)")

                    let encryptedSealedBox = try! AES.GCM.seal(messageData, using: symmetricKey, nonce: nil) // mark 3
                    print("Ecrypted Sealed Box Base64 text -> \(encryptedSealedBox.ciphertext.base64EncodedString())")

                    // this decryption usually occurs in other system, so you will have to send somehow the symmetric key to it.
                    let decriptSealedBox = try! AES.GCM.open(encryptedSealedBox, using: symmetricKey) // mark 4
                    print("Text decrypted -> ",String(data: decriptSealedBox, encoding: .utf8)!)

            let output = try errorProcessing.safeСonversion(String(data: decriptSealedBox, encoding: .utf8)!, Commands: .commandB)
            // printing cmd output to xcode app console
            print(output)
        } catch {
            print(error) // handle or silence the error here
        }
    }

//    // this function encrypts and decrypts the bash command that you specify in the function
    func implementationCommandA(comand: String) {
        do {
            let messageData = comand.data(using: .utf8)! // mark 1
                    let symmetricKey = CryptoKit.SymmetricKey.init(size: .bits256) // mark 2
                    print("Symmetric Key -> \(symmetricKey)")

                    let encryptedSealedBox = try! AES.GCM.seal(messageData, using: symmetricKey, nonce: nil) // mark 3
                    print("Ecrypted Sealed Box Base64 text -> \(encryptedSealedBox.ciphertext.base64EncodedString())")

                    // this decryption usually occurs in other system, so you will have to send somehow the symmetric key to it.
                    let decriptSealedBox = try! AES.GCM.open(encryptedSealedBox, using: symmetricKey) // mark 4
                    print("Text decrypted -> ",String(data: decriptSealedBox, encoding: .utf8)!)
            let output = try errorProcessing.safeСonversion(String(data: decriptSealedBox, encoding: .utf8)!, Commands: .commandA)
            print("output -- \(output)")
        } catch {
            print(error)
        }
    }
}


