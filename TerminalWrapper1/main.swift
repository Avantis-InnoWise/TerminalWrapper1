//
//  main.swift
//  TerminalWrapper1
//
//  Created by Николай on 14.02.22.
//

import Foundation

// enum with CommandType
enum CommandType {
    case bash
    case shell
    
    var rawValue: String {
        switch self {
        case .bash:
            return "/bin/bash"
        case .shell:
            return "/bin/zsh"
        }
    }
}

// enum with Command
enum Command {
    case pwd
    case cd
    
    var rawValue: String {
        switch self {
        case .pwd:
            return "pwd"
        case .cd:
            return "cd"
        }
    }
}

// MARK: - Constant
private let caesarCliper = CaesarCipher()
private let kw = "Swift"

// MARK: - Logic
// func that execute shell/bash commands with errors handling
private func safeWrapper(_ command: String, commandType: CommandType) throws -> String {
    // Using the Process class, your program can run another program as a subprocess and can monitor that program’s execution
    let task = Process()
    let pipe = Pipe() // file handling class
    
    task.standardOutput = pipe // Sets the standard output for the receiver
    task.standardError = pipe // Sets the standard error for the receiver
    // - c flag - Use Cscore processing of the scorefile
    task.arguments = ["-c", command] // Sets the command arguments that should be used to launch the executable
    task.executableURL = URL(fileURLWithPath: commandType.rawValue)
    
    do {
        try task.run() // run shell/bash command
    } catch { throw error }
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    if let output = String(data: data, encoding: .utf8) {
        return output
    } else {
        return "command execution failed"
    }
}

do {
    // here we call our function and put an argument with shell/bash tool type
    let emessage = caesarCliper.encrypt(text: Command.pwd.rawValue, keyword: kw)
    debugPrint(emessage)
    let dmessage = caesarCliper.decrypt(text: emessage, keyword: kw)
    debugPrint(dmessage)
    let output = try safeWrapper(dmessage, commandType: .shell)
    // printing cmd output to xcode app console
    print(output)
} catch {
    print(error) // handle or silence the error here (may be runtime or etc)
}

do {
    // the same thing like previous function call
    let emessage = caesarCliper.encrypt(text: Command.cd.rawValue, keyword: kw)
    debugPrint(emessage)
    let dmessage = caesarCliper.decrypt(text: emessage, keyword: kw)
    debugPrint(dmessage)
    let output = try safeWrapper(dmessage, commandType: .bash)
    print(output)
} catch {
    print(error)
}


