//
//  BaseballGame.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/4/24.
//

import Foundation

// 야구게임 프로토콜을 준수하는 클래스 선언
class BaseballGame: BaseballGameLogic  {
    var answer: [Int]?
    var result: String = ""
    var rightAnswer: Bool = false
    var playRecord: PlayData = PlayData()
    
    /// 숫자 야구게임의 정답과 입력값 비교
    /// - Parameters:
    ///   - currentNumber: 정답
    ///   - input: 사용자 숫자 입력
    func compareNumber(_ answer: [Int], _ userInput: String)throws {
        var input = Int(userInput) ?? 0
        var inputArray = [Int]()
        
        var strike: Int = 0
        var ball: Int = 0
        
        // 시도횟수를 카운트
        self.playRecord.tryCount += 1
        
        // 조건 1. 입력의 첫번째 값으로 0이 오면 오류
        let checkString = userInput.map { String($0) }
        guard checkString[0] != "0" else {
            throw BaseballGameError.enterValueOfZero
        }
        
        while input > 0 {
            // 조건 2. 중복값이 있을 경우 오류
            guard !inputArray.contains(input % 10) else {
                throw BaseballGameError.duplicateValue
            }
            inputArray.insert(input % 10, at: 0)
            input /= 10
        }
        
        // 조건 3. 정답값와 입력값의 수가 같지 않으면 오류
        guard inputArray.count == answer.count else {
            throw BaseballGameError.InputError
        }
        
        
        // 정답값과 입력값 비교(볼, 스트라이크 판정)
        for index in 0..<answer.count {
            if answer[index] == inputArray[index] {
                strike += 1
            } else if answer.contains(inputArray[index]) {
                ball += 1
            }
        }
        
        // 스트라이크가 정답값의 수와 같은지 확인
        // 같을 경우 정답을 출력하며 게임 종료
        guard !(strike == answer.count) else {
            result = "정답입니다!\n"
            print(result)
            rightAnswer = true
            return
        }
        
        // 볼, 스트라이크의 수를 프린트
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
