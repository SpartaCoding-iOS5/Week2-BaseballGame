//
//  GameJudge.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

import Foundation

// Judge user inputs and give hints or declare a win
struct GameJudge {
    
    // Provide different string depending on the number of pitch counter
    private func pitchCountString(_ pitchCount: Int) -> String {
        switch pitchCount {
        case 1: return "\(pitchCount)st"
        case 2: return "\(pitchCount)nd"
        case 3: return "\(pitchCount)rd"
        default: return "\(pitchCount)th"
        }
    }
    
    // Turn numbers into digits(array)
    private func digits(_ number: Int) -> [Int] {
        var mutableNumber = number
        var digits = [Int]()
        
        for _ in 0..<String(number).count {
            digits.insert(mutableNumber % 10, at: 0)
            mutableNumber /= 10
        }
        
        return digits
    }
    
    // Evaluate the user answer: Record game if correct, Give hints if wrong.
    func check(_ player: Player, _ pitch: Int) {
        var strikeCount = 0
        var ballCount = 0
        
        let targetNumberDigits = self.digits(player.currentTargetNumber)
        let pitchDigits = self.digits(pitch)
        
        for i in 0..<targetNumberDigits.count {
            if targetNumberDigits[i] == pitchDigits[i] {
                strikeCount += 1
            }
        }
        
        for i in 0..<targetNumberDigits.count {
            for j in 0..<pitchDigits.count {
                if i != j && targetNumberDigits[i] == pitchDigits[j] {
                    ballCount += 1
                }
            }
        }
        
        if strikeCount == 3 {
            player.didWinTheGame = 1 // 0 == false, 1 == true
            player.record()
            print("\nAyy, congrats! You nailed that \(self.pitchCountString(player.pitchCount)) pitch perfectly!") ; sleep(2) // Victory Royale
            player.shouldExitGameLoop = true
            return
        } else {
            print("[\(self.pitchCountString(player.pitchCount)) Pitch] Strikes: \(strikeCount), Balls: \(ballCount)") // Give hints
            return
        }
    }
}
