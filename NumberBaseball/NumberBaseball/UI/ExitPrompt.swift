//
//  ExitWarning.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//

import Foundation

// Ask if user really wants to exit
struct ExitPrompt {
    
    private func messageY() {
        print("""
        
        Okay, see ya dawg.
        """)
        sleep(1)
    }
    
    private func messageN() {
        print("""
        
        I gotcha homie, let's get back.
        """)
        sleep(1)
    }
    
    func askLoop(_ recordsCount: Int) {
        sleep(1)
        while true {
            print("You sure you wanna exit? Your records (\(recordsCount)) will be gone ( Y / N ) : ", terminator: "")
            
            guard let userInput = readLine()?.uppercased() else { continue }
            
            switch userInput {
            case "Y":
                messageY()
                exit(0)
            case "N":
                messageN()
                sleep(1)
                return
            default:
                print("You aight? Enter 'Y' or 'N'.")
            }
        }
        
    }
}
