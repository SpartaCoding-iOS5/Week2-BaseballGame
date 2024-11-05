//
//  selectedGame.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/5/24.
//

import Foundation

extension BaseballGame {
    var selected: String {
        return "1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기"
    }
}

extension Baseball {
    mutating func gameSelect() {
        if var game = self as? BaseballGame {
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print(game.selected)
            
            let input = readLine()
            if let input, let intInput = Int(input) {
                switch intInput {
                case 1:
                    print(MagicNumber.blank)
                    game.play()
                case 2:
                    print("게임 기록을 불러옵니다.")
                case 3:
                    print("< 게임을 종료합니다 >")
                    game.rightAnswer = true
                default:
                    print("올바르지 않은 입력값입니다.")
                }
            } else {
                print("올바르지 않은 입력값입니다.")
            }
        }
    }
}
