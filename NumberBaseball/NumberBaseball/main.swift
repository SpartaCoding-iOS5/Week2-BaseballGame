//
//  main.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//


import Foundation

let answersList = Answers().array // Declare an answers list
let validAnswers = Set(answersList) // Declare valid answers

var gameStats = GameStats() // Make an instance of GameStats
var records = gameStats.records // Declare a game records list
var currentGameNumber = gameStats.currentGameNumber // Declare a game counter

while true {
    print(Messages().welcome, terminator: "")
    guard let userInput = readLine()?.uppercased() else { continue }
    
    switch userInput {
    case "1": // 1. Start the game
        print(Messages().gameStarts, terminator: "")
        for i in 0...2 { print("\(3 - i)...") ; sleep(1) }
        print("")
        NumberBaseball().play()
    case "2" : //2. Check the game stats
        sleep(1)
        gameStats.show()
        continue
    case "3": //3. How to play
        sleep(1)
        let help = Help()
        help.showLoop()
    case "4": //4. Exit
        sleep(1)
        let recordsInstance = gameStats.records
        let exitProgram = ExitProgram()
        exitProgram.askLoop(recordsInstance.count)
    default:
        print(Messages().invalidInput)
        sleep(2)
        continue
    }
}
