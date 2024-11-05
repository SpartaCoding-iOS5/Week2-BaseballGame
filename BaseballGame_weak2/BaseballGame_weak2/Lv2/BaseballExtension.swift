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
        
        // 다운캐스팅으로 self를 복사하여 게임 실행
        if let game = self as? BaseballGame {
            // game.currentNumber = createRandomNumber()
            // Lv3 0을 포함하는 랜덤 수 생성하기
            game.currentNumber = createRandomNumberLv3()
            
            // compareNumber 함수의 결과가 정답인 경우
            // while 반복을 멈추고 게임 종료
            while game.rightAnswer != true {
                print("숫자를 입력하세요")
                
                let input = readLine()
                if let input, let intInput = Int(input) {
                    game.compareNumber(game.currentNumber!, intInput)
                } else {
                    print("올바르지 않은 입력값입니다.")
                }
            }
        }
    }
}


