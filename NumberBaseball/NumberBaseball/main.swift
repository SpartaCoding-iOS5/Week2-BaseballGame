//
//  main.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

import Foundation

let validPitches = ValidPitches().array // Declare a valid pitches list
let validAnswers = Set(validPitches) // Declare valid answers

let statManager = StatManager() // Make an instance of StatManager

while true {
    print(MainMessages().welcome, terminator: "")
    guard let userInput = readLine()?.uppercased() else { continue }
    
    switch userInput {
    case "1": // 1. Start the game
        print(MainMessages().gameStarts, terminator: "")
        for i in 0...2 { print("\(3 - i)...") ; sleep(1) }
        print("")
        NumberBaseball().play(statManager)
    case "2" : // 2. Check the game stats
        sleep(1)
        statManager.show()
        continue
    case "3": // 3. How to play
        HelpPrompt().showLoop()
    case "4": // 4. Exit
        ExitPrompt().askLoop(statManager.records.count)
    default:
        print(MainMessages().invalidInput)
        sleep(2)
        continue
    }
}
