//
//  NumberBaseball.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

import Foundation

// Take user inputs and send them to judge
class NumberBaseball {
    let targetNumber = TargetNumberGenerator().random() // Generate a target number
    let validTargetNumbers = Set(ValidTargetNumbers().threeDigits) // Declare valid taget numbers
    
    func play(_ player: Player) {
        // Game intro sequence
        player.resetDidWinTheGame() // reset (0 == false, 1 == true)
        player.resetPitchCount()
        print("\nAyy, bet! We about to dive in: ", terminator: "")
        for i in 0...2 { print("\(3 - i)...") ; sleep(1) }
        print("")
        
        // Game Loop
        while !player.shouldExitGameLoop {
            print("Throw a pitch! : ", terminator: "")
            
            // Prompt: Pitch
            guard let userInput = readLine() else { continue }
            
            if userInput == "help" { // Command: Shows help message
                _ = HelpPrompt().ask()
                continue
            } else if userInput == "quit" { // Command: Shows a prompt to quit current game
                if QuitPrompt().ask() {
                    if player.pitchCount != 0 {
                        player.record(targetNumber)
                        player.addCurrentGameNumber()
                    }
                    player.shouldExitGameLoop = true
                }
                continue
            }
            
            guard let pitch = Int(userInput), validTargetNumbers.contains(pitch) else { // Exception: Invalid Pitch
                print("\nAw dawg, your pitch was whack! Try 'help' for help.")
                continue
            }
            
            // Valid Pitch accepted to be sent to judge
            player.addPitchCount()
            GameJudge().check(player, targetNumber, pitch) // game ends when correct, otherwise print hints and return
        }
    }
}
