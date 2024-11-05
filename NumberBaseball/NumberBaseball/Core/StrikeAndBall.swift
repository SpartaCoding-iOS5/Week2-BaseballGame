//
//  HintGenerator.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

import Foundation

// Judge user inputs and give hints or declare a win
struct StrikeAndBall {
    private func pitchesString(_ pitches: Int) -> String {
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
    
    private func digits(_ number: Int) -> [Int] {
        var number = number
        var digits = [Int]()
        
        for _ in 0..<String(number).count {
            digits.insert(number % 10, at: 0)
            number /= 10
        }
        
        return digits
    }
    
    private func correctPitch(_ statManager: StatManager, _ pitches: Int) {
        statManager.record(pitches)
        statManager.incrementGameNumber()
        print("""
        
        Ayy, congrats! You nailed that \(self.pitchesString(pitches)) pitch perfectly!
        """)
        sleep(3)
    }
    
    func judge(_ statManager: StatManager, _ perfectPitch: Int, _ pitches: Int, _ pitch: Int) -> Int {
        let pitches = pitches
        
        var strikeCount = 0
        var ballCount = 0
        
        let perfectPitchDigits = self.digits(perfectPitch)
        let pitchDigits = self.digits(pitch)
        
        for i in 0..<perfectPitchDigits.count {
            if perfectPitchDigits[i] == pitchDigits[i] {
                strikeCount += 1
            }
        }
        
        for i in 0..<perfectPitchDigits.count {
            for j in 0..<pitchDigits.count {
                if i != j && perfectPitchDigits[i] == pitchDigits[j] {
                    ballCount += 1
                }
            }
        }
        
        if strikeCount == 3 {
            correctPitch(statManager, pitches)
            return -1
        } else {
            print("[\(self.pitchesString(pitches)) Pitch] Strikes: \(strikeCount), Balls: \(ballCount)")
            return pitches + 1
        }
    }
}
