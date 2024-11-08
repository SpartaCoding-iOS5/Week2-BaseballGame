//
//  User.swift
//  Week2-BaseballGame
//
//  Created by 권승용 on 11/7/24.
//

struct User: Player {
    func answer() throws -> Int {
        guard let userInput = readLine() else {
            throw BaseballGameError.InputError.notString
        }
        
        guard userInput.count == 3 else {
            throw BaseballGameError.InputError.countNotMatching
        }
        
        if Set(userInput).contains("0") {
            throw BaseballGameError.InputError.zeroDetected
        }
        
        guard let userAnswer = Int(userInput) else {
            throw BaseballGameError.InputError.notInteger
        }
        
        return userAnswer
    }
}
