//
//  main.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

import Foundation

let player = Player() // Make an instance of Player
var shouldExitMainLoop = false // Being true will exit main loop and thus program

// Provide a number-based interface
while !shouldExitMainLoop { // Main Loop
    print("""
    
    !=== Number Baseball ===!
    
    1. Start game
    2. Check out stats
    3. How to play
    4. Exit
    
    Pick a num: 
    """
    , terminator: "")
    
    guard let userInput = readLine()?.uppercased() else { continue } // Input Prompt
    
    switch userInput {
    case "1": // 1. Start the game
        player.shouldExitGameLoop = false
        NumberBaseball().play(player)
    case "2" : // 2. Check the game stats
        player.showRecords()
    case "3": // 3. How to play
        _ = HelpPrompt().ask()
    case "4": // 4. Exit
        shouldExitMainLoop = ExitPrompt().ask()
    default: // Exception: Invalid Input
        print("\nYou trippin? Pick a number between 1 and 4.")
        sleep(2)
    }
}

exit(0) // Exit the program when Main Loop breaks