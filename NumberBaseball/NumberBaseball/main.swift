//
//  main.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//


import Foundation

let answersList = Answers().array // Declare answers list
let validAnswers = Set(answersList) // Declare valid answers

while true {
    print(Messages().welcome, terminator: "")
    guard let userInput = readLine() else { continue }
    
    switch userInput {
    case "1": // 1. Start the game
        print(Messages().gameStarts, terminator: "")
        for i in 0...2 { print("\(3 - i)...") ; sleep(1) }
        print("")
        NumberBaseball().play()
    case "2" : //2. Check the game stats - not available
        print(Messages().gameStats)
        sleep(1)
        continue
    case "3": //3. Exit
        print(Messages().exitProgram)
        sleep(1)
        exit(0)
    default:
        print(Messages().invalidInput)
        sleep(1)
        continue
    }
}
