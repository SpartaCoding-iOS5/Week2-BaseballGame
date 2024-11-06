//
//  selectedGame.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/5/24.
//

import Foundation

extension BaseballGameLogic  {
    
    /// 게임의 타이틀, 게임, 기록, 종료 선택
    mutating func gameSelect() {
        // 현재 게임을 진행 중인지 확인하는 변수
        var isOnGame: Bool = true
        
        var playHistory: [String] = []
        
        print("환영합니다! 원하시는 번호를 입력해주세요")
        // 게임 종료를 선택할 때까지 반복
        while isOnGame {
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            
            let input = readLine()
            if let input, let intInput = Int(input) {
                switch intInput {
                case 1:
                    print(MagicNumber.blank)
                    playHistory.append(play())
                case 2:
                    print(MagicNumber.blank)
                    print("게임 기록을 불러옵니다.")
                    loadGameRecord(playHistory)
                case 3:
                    print(MagicNumber.blank)
                    print("< 게임을 종료합니다 >")
                    isOnGame = false
                default:
                    print("올바르지 않은 입력값입니다.")
                }
            } else {
                print("올바르지 않은 입력값입니다.")
            }
        }
    }
    
}
