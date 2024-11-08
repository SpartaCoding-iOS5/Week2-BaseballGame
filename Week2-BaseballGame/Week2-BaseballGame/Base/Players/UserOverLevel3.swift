//
//  UserOverLevel3.swift
//  Week2-BaseballGame
//
//  Created by 권승용 on 11/7/24.
//

struct UserOverLevel3: Player {
    func answer() throws -> Int {
        guard let userInput = readLine() else {
            throw BaseballGameError.InputError.notString
        }
        
        guard userInput.count == 3 else {
            throw BaseballGameError.InputError.countNotMatching
        }
        
        guard Set(userInput).count == 3 else {
            throw BaseballGameError.InputError.duplicatedNumber
        }
        
        if let fisrt = userInput.first, fisrt == "0" {
            throw BaseballGameError.InputError.zeroIsFirst
        }
        
        guard let userAnswer = Int(userInput) else {
            throw BaseballGameError.InputError.notInteger
        }
        
        return userAnswer
    }
}
