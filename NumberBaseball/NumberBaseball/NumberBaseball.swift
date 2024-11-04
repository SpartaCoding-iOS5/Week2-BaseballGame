//
//  NumberBaseball.swift
//  NumberBaseball
//
//  Created by t0000-m0112 on 11/4/24.
//


class NumberBaseball {
    let solution = AnswerGenerator().random(answersList) // Generate an answer
    
    func play() {
        while true {
            print("Throw a 3-digit pitch! : ", terminator: "")
            guard let userInput = readLine() else { continue }
            
            if userInput == "help" {
                print(Messages().help)
                continue
            }
            
            guard let pitch = Int(userInput), validAnswers.contains(pitch) else {
                print(Messages().invalidPitch)
                continue
            }
            
            StrikeAndBall.judge(solution, pitch)
        }
    }
    
}
