//
//  ErrorProcessing.swift
//  TerminalWrapper1
//
//  Created by Николай on 15.02.22.
//

import Foundation

final class ErrorProcessing {
    
    // function for secure command processing
    func safeСonversion(_ commandName: String, Commands: Commands) throws -> String {
        /* Using the Process class, your program can run another program as a subprocess and can monitor that program’s execution.
         A Process object creates a separate executable entity; it differs from Thread in that it does not share memory space with the process that creates it. */
       let process = Process()
        /* Pipe objects provide an object-oriented interface for accessing pipes.
        An Pipe object represents both ends of a pipe and enables communication through the pipe. */
       let pipe = Pipe()
       /* If file is an NSPipe object, launching the receiver automatically closes the write end of the pipe in the current task.
       Don’t create a handle for the pipe and pass that as the argument, or the write end of the pipe won’t be closed automatically.*/
       process.standardOutput = pipe
       /* If file is an NSPipe object, launching the receiver automatically closes the write end of the pipe in the current task.
       Don’t create a handle for the pipe and pass that as the argument, or the write end of the pipe won’t be closed automatically.*/
       process.standardError = pipe
       /* - c flag - Use Cscore processing of the scorefile
       The NSTask object converts both path and the strings in arguments to appropriate C-style strings (using fileSystemRepresentation) before passing them to the task via argv[] .
        The strings in arguments do not undergo shell expansion, so you do not need to do special quoting, and shell variables, such as $PWD, are not resolved.*/
       process.arguments = ["-c", commandName]
       process.executableURL = URL(fileURLWithPath: Commands.rawValue)
       return try runTask(task: process, pipe: pipe)
   }

       // run shell/bash command
   private func runTask(task: Process, pipe: Pipe) throws -> String {
       do {
           try task.run()
       } catch {
           throw error
       }
       // The descriptor represented by this object is deleted, and the object itself is automatically deallocated when the receiver is deallocated.
       let data = pipe.fileHandleForReading.readDataToEndOfFile()
       if let output = String(data: data, encoding: .utf8) {
           return output
       } else {
           return "command execution failed"
       }
   }
}
