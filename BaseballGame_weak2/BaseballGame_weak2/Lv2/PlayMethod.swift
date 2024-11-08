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
        
        // 다운캐스팅된 game은 BaseballGame 인스턴스이다.
        // play()를 실행한 인스턴스는 main에서 생성한 인스턴스.
        // game = main에서 생성한 인스턴스.
        if let game = self as? BaseballGame {
            game.answer = createAnswerLv3()
            game.playRecord.playCount += 1
            game.playRecord.tryCount = 0
                        
            // 정답을 맞출 때까지 반복
            while game.rightAnswer != true {
                print("숫자를 입력하세요")
                
                // 콘솔 입력값을 확인하고 Int 타입으로 변환
                // 변환 실패시 오류 메세지 출력
                let userInput = readLine()
                if let userInput {
                    do {
                        try game.compareNumber(game.answer ?? [], userInput)
                    } catch BaseballGameError.InputError {
                        print("\n올바르지 않은 입력값입니다.\n\(BaseballGameError.InputError.errorDescription)")
                    } catch BaseballGameError.duplicateValue {
                        print("\n올바르지 않은 입력값입니다.\n\(BaseballGameError.duplicateValue.errorDescription)")
                    } catch BaseballGameError.enterValueOfZero {
                        print("\n올바르지 않은 입력값입니다.\n\(BaseballGameError.enterValueOfZero.errorDescription)")
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print("\n올바르지 않은 입력값입니다.\n")
                }
            }
            // 게임 초기화
            game.rightAnswer = false
            
            // 게임의 시도 횟수를 반환
            return game.playRecord.record
        }
        return "게임을 실행할 수 없습니다."
    }
}


