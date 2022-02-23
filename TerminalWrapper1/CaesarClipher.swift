//
//  CaesarClipher.swift
//  TerminalWrapper1
//
//  Created by Николай on 15.02.22.
//

import Foundation

final class CaesarCipher {
    
    // MARK: - Properties
    /* Alphabet list
       Creating the alphabet list is pretty simple. Create a new playground file and store each character in an array:*/
    private let alphabetList = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                                "1", "2", "3", "4","5", "6", "7", "8", "9", "0", "-", ".", "/"]
    
    // Сreating an encryption function
     func codeEncryptio(text: String, keyword: String) -> String {
        let text = text.lowercased()
        let key = uniqueKeyGeneration(keyword: keyword)
        let alphabet = shiftAlphabetList(key: key)
        let map = encryptDecryptMessage(reversed: alphabet).encryption
        
        var encrypted = String()
        
        for character in text {
            if character == " " { encrypted.append(":") }
            if let string = map[String(character)] {
                encrypted.append(string)
            }
        }
        return encrypted.uppercased()
    }
    
    // Сreating an decryption function
     func codeDecryption(text: String, keyword: String) -> String {
        let text = text.lowercased()
        let key = uniqueKeyGeneration(keyword: keyword)
        let alphabet = shiftAlphabetList(key: key)
        let map = encryptDecryptMessage(reversed: alphabet).decryption
        
        var decrypted = String()
        
        for character in text {
            if character == ":" {
                decrypted.append(" ")
            }
            
            else if let string = map[String(character)] {
                decrypted.append(string)
            }
        }
        return decrypted
    }
    
}
    private extension CaesarCipher {
    // func generate a unique key
     func uniqueKeyGeneration(keyword: String) -> String {
        var string = String()
        for character in keyword {
            if !string.contains(String(character)) {
                string.append(character)
            }
        }
        return string.lowercased()
    }
    
    /* Create unique alphabet
      We need to create a function to reverse the alphabet list. Which we will use in the shiftAlphabetList function.*/
     func reversed(alphabet: [String]) -> [String] {
        var alphabet = alphabet
        var startIndex = alphabet.startIndex
        var endIndex = alphabet.endIndex - 1
        
        for _ in 0..<alphabet.count / 2 {
            
            let sString = alphabet[startIndex]
            let eString = alphabet[endIndex]
            
            alphabet.remove(at: startIndex)
            alphabet.insert(eString, at: startIndex)
            
            alphabet.remove(at: endIndex)
            alphabet.insert(sString, at: endIndex)
            
            startIndex = startIndex + 1
            endIndex = endIndex - 1
        }
        
        return alphabet
    }
    
    // Next we create the shiftAlphabetList function which will leverage our reversed function.
    private func shiftAlphabetList(key: String) ->[String] {
        var alphabet = alphabetList
        
        for (idx, char) in key.enumerated() {
            if let index = alphabet.firstIndex(of: String(char)) {
                let element = alphabet.remove(at: index)
                alphabet.insert(element, at: idx)
            }
        }
        return reversed(alphabet: alphabet)
    }
    
    // Now we create a map function that will help encrypt or decrypt our messages.
    private func encryptDecryptMessage(reversed: [String]) -> (encryption: [String : String], decryption: [String : String]) {
        var encryptMessage = [String : String]()
        var decryptMessage = [String : String]()
        
        for (index, letter) in reversed.enumerated() {
            encryptMessage[alphabetList[index]] = letter
            decryptMessage[letter] = alphabetList[index]
        }
        return (encryption: encryptMessage, decryption: decryptMessage)
    }
    
}
