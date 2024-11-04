//
//  HintGenerator.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//


class StrikeAndBall {
    private static func digits(_ number: Int) -> [Int] {
        var number = number
        var digits = [Int]()
        
        for _ in 0..<String(number).count {
            digits.insert(number % 10, at: 0)
            number /= 10
        }
        
        return digits
    }
    
    static func judge(_ solution: Int, _ pitch: Int) {
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
            print(Messages().congrats)
        } else {
            print("Strikes: \(strikeCount), Balls: \(ballCount)")
        }
    }
}
