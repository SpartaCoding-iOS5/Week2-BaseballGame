//
//  main.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

import Foundation

let answersList = Answers().array // Declare answers list
let validAnswers = Set(answersList) // Declare valid answers
let solution = AnswerGenerator().random(answersList) // Generate an answer
let invalidPitchMessage = "Aw dawg, your pitch was whack! Try 'help' for help." // Message for invalid inputs

while true {
    print("Throw a 3-digit pitch! : ", terminator: "")
    guard let userInput = readLine() else { continue }
    
    if userInput == "help" {
        print(Help().rules)
        continue
    }
    
    guard let pitch = Int(userInput), validAnswers.contains(pitch) else {
        print(invalidPitchMessage)
        continue
    }
    
    StrikeAndBall.judge(solution, pitch)
}
