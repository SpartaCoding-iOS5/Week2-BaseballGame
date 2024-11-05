//
//  NumberBaseball.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

// Take user inputs and send them to judge
class NumberBaseball {
    let perfectPitch = PerfectPitchGenerator().random(pitchesList) // Generate an answer
    var pitches = 1 // Declare a pitch counter
    var shouldExitGameLoop = false // correct answer turns this to true
    
    func play() {
        while !self.shouldExitGameLoop {
            print("Throw a pitch! : ", terminator: "")
            
            guard let userInput = readLine() else { continue }
            
            if userInput == "help" { // Shows help message
                let help = Help()
                help.showLoop()
                continue
            } else if userInput == "quit" { // Shows a prompt to quit current game
                let quitGame = QuitGame()
                shouldExitGameLoop = quitGame.askLoop()
                continue
            }
            
            guard let pitch = Int(userInput), validAnswers.contains(pitch) else { // Exception Handling: Invalid Input
                print("""

                Aw dawg, your pitch was whack! Try 'help' for help.
                """)
                continue
            }
            
            let strikeAndBall = StrikeAndBall()
            pitches = strikeAndBall.judge(perfectPitch, pitch, pitches) // returns -1 when correct, otherwise print hints
            shouldExitGameLoop = pitches == -1 // Exits loop when the pitch was correct.
        }
    }
}
