//
//  BaseballGameLevel2.swift
//  Week2-BaseballGame
//
//  Created by 권승용 on 11/7/24.
//
import Foundation

struct BaseballGameLevel2 {
    func startGame() throws {
        let computerAnswer = try Computer().answer()
        
        while true {
            print("숫자를 입력하세요")
            let userAnswer = try User().answer()
            if userAnswer == computerAnswer {
                print("정답입니다!")
                break
            } else {
                giveHint(computerAnswer: computerAnswer, userAnswer: userAnswer)
            }
        }
    }
    
    private func giveHint(computerAnswer: Int, userAnswer: Int) {
        let userAnswerArr = Array(String(userAnswer))
        let computerAnswerArr = Array(String(computerAnswer))
        
        var strikes = 0
        var balls = 0
        
        for index in userAnswerArr.indices {
            if userAnswerArr[index] == computerAnswerArr[index] {
                strikes += 1
            } else if computerAnswerArr.contains(userAnswerArr[index]) {
                balls += 1
            }
        }
        
        switch (strikes, balls) {
        case (0, 0):
            print("Nothing")
        case (0, _):
            print("\(balls)볼")
        case (_, 0):
            print("\(strikes)스트라이크")
        case (_, _):
            print("\(strikes)스트라이크 \(balls)볼")
        }
    }
}
