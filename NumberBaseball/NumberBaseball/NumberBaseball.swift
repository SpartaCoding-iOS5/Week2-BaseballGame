//
//  NumberBaseball.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//


class NumberBaseball {
    let solution = AnswerGenerator().random(answersList) // Generate an answer
    var shouldExitGameLoop = false
    
    func play() {
        while !self.shouldExitGameLoop {
            print("Throw a pitch! : ", terminator: "")
            guard let userInput = readLine() else { continue }
            
            if userInput == "help" {
                let help = Help()
                help.showLoop()
                continue
            } else if userInput == "quit" {
                let quitGame = QuitGame()
                shouldExitGameLoop = quitGame.askLoop()
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
