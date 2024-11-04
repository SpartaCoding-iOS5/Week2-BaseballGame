//
//  BaseballGame.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/4/24.
//

import Foundation

// 야구게임 프로토콜을 준수하는 구조체 선언
class BaseballGame: Baseball {
    var currentNumber: [Int]?
    var result: String = ""
    var rightAnswer: Bool = false
    
    static let baseballGame = BaseballGame()
    
    func compareNumber(_ currentNumber: [Int], _ input: Int) {
        var number = input
        var numberArray = [Int]()
        
        var strike: Int = 0
        var ball: Int = 0
        
        while number > 0 {
            guard !numberArray.contains(number % 10) else {
                result = "올바르지 않은 입력값입니다."
                print(result)
                return
            }
            numberArray.insert(number % 10, at: 0)
            number /= 10
        }
        
        guard numberArray.count == currentNumber.count else {
            result = "올바르지 않은 입력값입니다."
            print(result)
            return
        }
        
        guard !numberArray.contains(0) else {
            result = "올바르지 않은 입력값입니다."
            print(result)
            return
        }
        
        for index in 0..<currentNumber.count {
            if currentNumber[index] == numberArray[index] {
                strike += 1
            } else if currentNumber.contains(numberArray[index]) {
                ball += 1
            }
        }
        
        guard !(strike == currentNumber.count) else {
            result = "정답입니다!"
            print(result)
            BaseballGame.baseballGame.rightAnswer = true
            return
        }
        
        if ball > 0 && strike == 0 {
            result = "\(ball)볼\n"
            print(result)
        } else if ball > 0 && strike > 0 {
            result = "\(strike)스트라이크 \(ball)볼\n"
            print(result)
        } else if ball == 0 && strike > 0 {
            result = "\(strike)스트라이크\n"
            print(result)
        } else if ball == 0 && strike == 0 {
            result = "Out!!\n"
            print(result)
        }
    }
}
