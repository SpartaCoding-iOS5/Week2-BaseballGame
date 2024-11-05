//
//  GameTry.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/5/24.
//

import Foundation

extension Baseball {
    public mutating func tryGame() {
        if let game = self as? BaseballGame {
            game.currentNumber = createRandomNumberLv3()
            
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
        }
    }
}
