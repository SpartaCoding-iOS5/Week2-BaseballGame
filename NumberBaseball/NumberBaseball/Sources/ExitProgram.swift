//
//  ExitWarning.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//

import Foundation

// Ask if user really wants to exit
struct ExitProgram {
    let messageY = """
    
    Okay, see ya soon dawg.
    """

    let messageN = """
    
    I gotcha homie, let's get back.
    """
    
    func askLoop(_ recordsCount: Int) {
        while true {
            print("You sure you wanna exit? Your records (\(recordsCount)) will be gone ( Y / N ) : ", terminator: "")
            
            guard let userInput = readLine()?.uppercased() else { continue }
            
            switch userInput {
            case "Y":
                print(self.messageY)
                sleep(1)
                exit(0)
            case "N":
                print(self.messageN)
                sleep(1)
                return
            default:
                print("You aight? Enter 'Y' or 'N'.")
            }
        }
        
    }
}
