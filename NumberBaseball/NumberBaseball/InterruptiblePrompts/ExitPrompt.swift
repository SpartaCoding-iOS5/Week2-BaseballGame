//
//  ExitPrompt.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//

import Foundation

// Ask if the user really wants to exit the program
struct ExitPrompt: InterruptiblePrompt {

    func ask(_ player: Player) -> Bool {
        sleep(1)
        
        // Exit Loop
        while true {
            print("\nYou sure you wanna exit? Your records (\(player.recordsCount())) will be gone ( Y / N ) : ", terminator: "")
            
            // Prompt: Y or N
            guard let userInput = readLine()?.uppercased() else { continue }
            
            let userInputLetter = userInput.filter({ $0.isLetter }) // Input Sanitization
            switch userInputLetter {
            case "Y":
                print("\nOkay, see ya dawg.") ; sleep(1)
                return true // Exit the program
            case "N":
                print("\nI gotcha homie, let's get back.") ; sleep(1)
                return false // Return to Main Loop
            default:
                print("\nYou alright? Enter 'Y' or 'N'.") // Go back to Y/N prompt
            }
        }
        
    }
}
