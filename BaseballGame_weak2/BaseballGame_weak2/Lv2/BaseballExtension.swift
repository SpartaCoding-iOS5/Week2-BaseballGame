//
//  BaseballExtension.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/4/24.
//

import Foundation

// 프로토콜에서 메소드 구현하기
extension Baseball {
    // self.rightAnswer의 값을 바꿔야 하기 때문에 mutating 선언
    public mutating func play() {
        print("< 게임을 시작합니다 >")
        currentNumber = createRandomNumber()
        // compareNumber 함수의 결과가 정답인 경우
        // while 반복을 멈추고 게임 종료
        while BaseballGame.baseballGame.rightAnswer != true {
            print("숫자를 입력하세요")
            
            let input = readLine()
            if let input, let intInput = Int(input) {
                BaseballGame.baseballGame.compareNumber(currentNumber ?? [], intInput)
            } else {
                print("올바르지 않은 입력값입니다.")
            }
        }
    }
}


