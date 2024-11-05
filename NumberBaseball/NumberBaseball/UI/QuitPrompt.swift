//
//  QuitPrompt.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//

import Foundation

struct QuitPrompt {
    
    private func messageY() {
        print("""
        
        Aight, see ya next game.
        """)
        sleep(1)
    }
    
    private func messageN() {
        print("""
        
        Gotcha homie, gettin back into game.
        """)
        sleep(1)
    }

    func askLoop() -> Bool {
        while true {
            print("You sure you wanna quit? ( Y / N ) : ", terminator: "")
            
            guard let userInput = readLine()?.uppercased() else { continue }
            
            switch userInput {
            case "Y":
                messageY()
                return true // shouldExitGameLoop = true
            case "N":
                messageN()
                return false // shouldExitGameLoop = false
            default:
                print("You aight? Enter 'Y' or 'N'.")
            }
        }
    }
}
