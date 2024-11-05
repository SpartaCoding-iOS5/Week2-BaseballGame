//
//  BaseballGame.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/4/24.
//

import Foundation

// 야구게임 프로토콜을 준수하는 클래스 선언
class BaseballGame: Baseball {
    var currentNumber: [Int]?
    var result: String = ""
    var rightAnswer: Bool = false
        
    func compareNumber(_ currentNumber: [Int], _ input: Int) {
        var number = input
        var numberArray = [Int]()
        
        var strike: Int = 0
        var ball: Int = 0
        
        while number > 0 {
            // 조건 1. 중복값이 있을 경우 오류
            guard !numberArray.contains(number % 10) else {
                result = "올바르지 않은 입력값입니다.\n"
                print(result)
                return
            }
            numberArray.insert(number % 10, at: 0)
            number /= 10
        }
        
        // 조건 2. 정답값와 입력값의 수가 같지 않으면 오류
        guard numberArray.count == currentNumber.count else {
            result = "올바르지 않은 입력값입니다.\n"
            print(result)
            return
        }
        
        // 조건 3. 입력값에 0이 있을 경우 오류
        // Lv3 에서 0을 포함했기 때문에 조건 폐기
//        guard !numberArray.contains(0) else {
//            result = "올바르지 않은 입력값입니다."
//            print(result)
//            return
//        }
        
        // 조건 4. 입력의 첫번째 값으로 0이 오면 오류
        guard numberArray.first != 0 else {
            result = "올바르지 않은 입력값입니다.\n"
            print(result)
            return
        }
        
        // 정답값과 입력값 비교(볼, 스트라이크 판정)
        for index in 0..<currentNumber.count {
            if currentNumber[index] == numberArray[index] {
                strike += 1
            } else if currentNumber.contains(numberArray[index]) {
                ball += 1
            }
        }
        
        // 스트라이크가 정답값의 수와 같은지 확인
        // 같을 경우 정답을 출력하며 게임 종료
        guard !(strike == currentNumber.count) else {
            result = "정답입니다!"
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
