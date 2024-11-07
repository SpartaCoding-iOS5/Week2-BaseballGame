//
//  QuitPrompt.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//

import Foundation

// Ask if the user really wants to leave current game.
struct QuitPrompt: InterruptiblePrompt {

    // Quit Loop
    func ask() -> Bool {
        while true {
            print("\nYou sure you wanna quit? ( Y / N ) : ", terminator: "")
            
            // Prompt: Y or N
            guard let userInput = readLine()?.uppercased() else { continue }
            
            let userInputLetter = userInput.filter({ $0.isLetter }) // Input Sanitization
            switch userInputLetter {
            case "Y":
                print("\nAight, see ya next game.") ; sleep(1)
                return true // shouldExitGameLoop = true
            case "N":
                print("\nGotcha homie, gettin back into game.") ; sleep(1)
                return false // shouldExitGameLoop = false
            default:
                print("\nYou alright? Enter 'Y' or 'N'.") // Go back to Y/N prompt
            }
        }
    }
}
