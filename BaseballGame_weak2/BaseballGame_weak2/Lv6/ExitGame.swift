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
    /// 게임을 종료하는 메소드
    /// - Returns: true 라면 종료, false 라면 되돌아가기
    func exitGame() -> Bool {
        var exit: Bool = true
        
        print("게임을 종료하시겠습니까?")
        print("Y / N")
        
        let userInput = readLine()
        if let userInput {
            if userInput == "y" || userInput == "Y" {
                exit = true
                print("< 게임을 종료합니다 >")
            } else if userInput == "n" || userInput == "N" {
                exit = false
                print(MagicNumber.blank)
            } else {
                print("올바르지 않은 입력값입니다.")
                print(MagicNumber.blank)
            }
        } else {
            print("올바르지 않은 입력값입니다.")
        }
        
        return exit
    }
}
