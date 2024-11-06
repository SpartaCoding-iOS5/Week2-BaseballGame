//
//  BaseballExtension.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/4/24.
//

import Foundation

// 프로토콜에서 메소드 구현하기
extension BaseballGameLogic  {
    /// 게임을 시작하는 메소드
    public mutating func play() -> String {
        print("< 게임을 시작합니다 >")
        
        // 게임을 실행
        if let game = self as? BaseballGame {
            game.currentNumber = createRandomNumberLv3()
            game.playRecord.playCount += 1
            game.playRecord.tryCount = 0
            
            // Test
            print(game.currentNumber)
            
            // 정답을 맞출 때까지 반복
            while game.rightAnswer != true {
                print("숫자를 입력하세요")
                
                // 콘솔 입력값을 확인하고 Int 타입으로 변환
                // 변환 실패시 오류 메세지 출력
                let input = readLine()
                if let input, let intInput = Int(input) {
                    do {
                        try game.compareNumber(game.currentNumber ?? [], intInput)
                    } catch BaseballGameError.InputError {
                        print("올바르지 않은 입력값입니다.\n\(BaseballGameError.InputError.rawValue)")
                    } catch BaseballGameError.duplicateValue {
                        print("올바르지 않은 입력값입니다.\n\(BaseballGameError.duplicateValue.rawValue)")
                    } catch BaseballGameError.enterValueOfZero {
                        print("올바르지 않은 입력값입니다.\n\(BaseballGameError.enterValueOfZero.rawValue)")
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print("올바르지 않은 입력값입니다.")
                }
            }
            
            // 게임의 시도 횟수를 반환
            game.playRecord.savedGameRecord()
            game.rightAnswer = false
            
            return game.playRecord.history
        }
        return "게임 기록을 불러올 수 없습니다"
    }
}


