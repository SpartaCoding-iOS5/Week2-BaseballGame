//
//  ExitWarning.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//

import Foundation

class ExitProgram {
    let exitProgramY = """
    
    Okay, see ya soon dawg.
    """
    
    let exitProgramN = """
    
    I gotcha homie, let's get back.
    """
    
    func askLoop() {
        while true {
            print("You sure you wanna exit? Your records (\(records)) will be gone ( Y / N ) : ", terminator: "")
            
            guard let userInput = readLine()?.uppercased() else { continue }
            
            switch userInput {
            case "Y":
                print(self.exitProgramY)
                sleep(1)
                exit(0)
            case "N":
                print(self.exitProgramN)
                sleep(1)
                return
            default:
                print("You aight? Enter 'Y' or 'N'.")
            }
        }
        
    }
}
