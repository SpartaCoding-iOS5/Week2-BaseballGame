//
//  NumberBaseball.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

import Foundation

// Take user inputs and send them to judge
struct GameManager {
    func play(_ player: Player) {
        // Game intro sequence
        player.resetDidWinTheGame() // reset to 0 (0 == false, 1 == true)
        player.resetPitchCount() // reset pitch count to 0
        
        let queue = DispatchQueue.global() // Background thread
        queue.async { player.takeTargetNumber() } // Take a random target number, TC: O(n)
        
        print("\nAyy, bet! We about to dive in: ", terminator: "") // Print while trget number is being generated (3 seconds)
        for i in 0...2 { print("\(3 - i)...") ; sleep(1) }
        print("")
        
        // Game Loop
        while !player.shouldExitGameLoop {
            print("Throw a pitch! : ", terminator: "")
            
            // Prompt: Pitch
            guard let userInput = readLine() else { continue }
            
            let userInputLetter = userInput.filter({ $0.isLetter }) // Input Sanitization
            if userInputLetter == "help" { // Command: Shows help message
                _ = HelpPrompt().ask()
                continue
            } else if userInputLetter == "quit" { // Command: Shows a prompt to quit current game
                if QuitPrompt().ask() {
                    if player.pitchCount != 0 {
                        player.record()
                        player.addCurrentGameNumber()
                    }
                    player.shouldExitGameLoop = true
                }
                continue
            }
            
            let userInputNumber = userInput.filter({ $0.isNumber }) // Input Sanitization
            guard let pitch = Int(userInputNumber), ValidTargetNumbers().set.contains(pitch) else { // Exception: Invalid Pitch
                print("\nAw dawg, your pitch was whack! Try 'help' for help.")
                continue
            }
            
            player.addPitchCount() // Valid Pitch accepted to be sent to judge
            GameJudge().check(player, pitch) // game ends when correct, otherwise print hints and return
        }
    }
}
