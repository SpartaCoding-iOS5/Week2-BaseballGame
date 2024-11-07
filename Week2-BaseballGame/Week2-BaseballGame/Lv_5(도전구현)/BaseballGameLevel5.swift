//
//  BaseballGameLevel5.swift
//  Week2-BaseballGame
//
//  Created by 권승용 on 11/7/24.
//

class BaseballGameLevel5: BaseballGameLevel4 {
    override func proceedGame(questioner: Player, answerer: Player) throws {
        let question = try questioner.answer()
        var count = 1
        
        print("<게임을 시작합니다>")
        while true {
            print("숫자를 입력하세요")
            let userAnswer = try answerer.answer()
            if userAnswer == question {
                print("정답입니다!")
                RecordManager.shared.record(count)
                break
            } else {
                giveHint(computerAnswer: question, userAnswer: userAnswer)
                count += 1
            }
        }
    }
    
    override func showRecord() {
        RecordManager.shared.printRecords()
    }
}
