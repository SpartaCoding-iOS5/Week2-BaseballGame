//
//  ExitGame.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/6/24.
//

import Foundation

protocol ExitGame {
    func exitGame() -> Bool
}

extension BaseballGameLogic {
    func exitGame() -> Bool {
        var answer: Bool = true
        
        print("게임을 종료하시겠습니까?")
        print("Y / N")
        
        let input = readLine()
        if let input {
            if input == "y" || input == "Y" {
                answer = false
                print("< 게임을 종료합니다 >")
            } else if input == "n" || input == "N" {
                answer = true
                print(MagicNumber.blank)
            } else {
                print("올바르지 않은 입력값입니다.")
                print(MagicNumber.blank)
            }
        } else {
            print("올바르지 않은 입력값입니다.")
        }
        
        return answer
    }
}
