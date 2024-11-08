//
//  BaseballGameLevel1.swift
//  Week2-BaseballGame
//
//  Created by 권승용 on 11/7/24.
//

class BaseballGameLevel1: BaseballGame {
    override func startGame(questioner: Player, answerer: Player) throws {
        let question = try questioner.answer()
        
        print("Level1 게임에 오신 것을 환영합니다.")
        print("1에서 9까지의 서로 다른 임의의 3자리 수를 입력해 주세요.")
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
