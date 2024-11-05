//
//  HintGenerator.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

import Foundation

struct StrikeAndBall {
    func pitchesString(_ pitches: Int) -> String {
        switch pitches {
        case 1:
            return "\(pitches)st"
        case 2:
            return "\(pitches)nd"
        case 3:
            return "\(pitches)rd"
        default:
            return "\(pitches)th"
        }
    }
    
    func digits(_ number: Int) -> [Int] {
        var number = number
        var digits = [Int]()
        
        for _ in 0..<String(number).count {
            digits.insert(number % 10, at: 0)
            number /= 10
        }
        
        return digits
    }
    
    func judge(_ solution: Int, _ pitch: Int, _ pitches: Int) -> Int {
        let pitches = pitches
        
        var strikeCount = 0
        var ballCount = 0
        
        let solutionDigits = self.digits(solution)
        let pitchDigits = self.digits(pitch)
        
        for i in 0..<solutionDigits.count {
            if solutionDigits[i] == pitchDigits[i] {
                strikeCount += 1
            }
        }
        
        for i in 0..<solutionDigits.count {
            for j in 0..<pitchDigits.count {
                if i != j && solutionDigits[i] == pitchDigits[j] {
                    ballCount += 1
                }
            }
        }
        
        if strikeCount == 3 {
            gameStats.record(pitches)
            gameStats.incrementGameNumber()
            print("""
            
            Ayy, congrats! You nailed that \(self.pitchesString(pitches)) pitch perfectly!
            """)
            sleep(3)
            return -1
        } else {
            print("[\(self.pitchesString(pitches)) Pitch] Strikes: \(strikeCount), Balls: \(ballCount)")
            return pitches + 1
        }
    }
}
