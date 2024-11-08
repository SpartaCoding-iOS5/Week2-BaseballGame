//
//  BaseballGameLevel1.swift
//  Week2-BaseballGame
//
//  Created by 권승용 on 11/7/24.
//

import Foundation

struct BaseballGameLevel1 {
    static func startGame(questioner: Player, answerer: Player) throws {
        let question = try questioner.answer()
        while true {
            if try answerer.answer() == question {
                print("정답입니다!")
                print("게임을 종료합니다.")
                break
            } else {
                print("정답이 아닙니다...")
                print("다시 입력해 주세요.")
            }
        }
    }
}
