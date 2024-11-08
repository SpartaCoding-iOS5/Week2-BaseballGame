//
//  GameManager.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

import Foundation

// Take user inputs and send them to judge
struct GameManager {
    private func generateTargetNumberWhilePrint(_ player: Player) {
        let group = DispatchGroup() // Background thread for target number generation
        let queue = DispatchQueue.global()
        
        group.enter() ; queue.async { player.generateTargetNumber() ; group.leave() } // Take a random target number
        
        print("\nAyy, bet! We about to dive in: ", terminator: "")
        for i in 0...2 { print("\(3 - i)...") ; sleep(1) }
        print("")
        
        group.wait() // Wait for the target number to be generated
    }
    
    func play(_ player: Player) {
        // Game intro sequence
        player.didWinTheGame = false // reset to false
        player.pitchCount = 0 // reset pitch count to 0
        generateTargetNumberWhilePrint(player) // Take a random target number while printing countdown
        
        // Game Loop
        while !player.shouldExitGameLoop {
            print("Throw a pitch! : ", terminator: "")
            
            // Prompt: Pitch
            guard let userInput = readLine() else { continue }
            
            let userInputLetter = userInput.filter({ $0.isLetter }) // Input Sanitization
            if userInputLetter == "help" { // Command: Shows help message
                _ = HelpPrompt().ask(player)
                continue
            } else if userInputLetter == "quit" { // Command: Shows a prompt to quit current game
                if QuitPrompt().ask(player) {
                    if player.pitchCount != 0 { // If player didn't throw a pitch -> no record, no adding game number
                        player.record()
                        player.currentGameNumber += 1
                    }
                    player.shouldExitGameLoop = true
                }
                continue
            }
            
            let userInputNumber = userInput.filter({ $0.isNumber }) // Input Sanitization
            guard let pitch = Int(userInputNumber), ValidTargetNumbers.set.contains(pitch) else { // Exception: Invalid Pitch
                print("\nAw dawg, your pitch was whack! Try 'help' for help.")
                continue
            }
            
            player.pitchCount += 1 // Valid Pitch accepted to be sent to judge
            GameJudge().check(player, pitch) // game ends when correct, otherwise print hints and return
        }
    }
}
