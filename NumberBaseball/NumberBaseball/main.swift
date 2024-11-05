//
//  main.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//


import Foundation

let answersList = Answers().array // Declare answers list
let validAnswers = Set(answersList) // Declare valid answers

var records = 0 // How many game records are

while true {
    print(Messages().welcome, terminator: "")
    guard let userInput = readLine()?.uppercased() else { continue }
    
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
    case "3": //3. help
        sleep(1)
        let help = Help()
        help.showLoop()
    case "4": //4. Exit
        sleep(1)
        let exitProgram = ExitProgram()
        exitProgram.askLoop()
    default:
        print(Messages().invalidInput)
        sleep(2)
        continue
    }
}
