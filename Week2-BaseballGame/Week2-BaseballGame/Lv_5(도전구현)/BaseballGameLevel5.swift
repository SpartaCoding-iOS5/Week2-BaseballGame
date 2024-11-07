//
//  BaseballGameLevel5.swift
//  Week2-BaseballGame
//
//  Created by 권승용 on 11/7/24.
//

class BaseballGameLevel5: BaseballGameLevel4 {
    
    override func startGame(questioner: any Player, answerer: any Player) throws {
        print("환영합니다! 원하시는 번호를 입력해주세요")
        
        while true {
            print("1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            
            if let input = readLine(), let num = Int(input) {
                switch num {
                case 1:
                    try proceedGame(questioner: questioner, answerer: answerer)
                    
                case 2:
                    RecordManager.shared.printRecords()
                    
                case 3:
                    break
                    
                default:
                    break
                }
            }
        }
    }
    
    func proceedGame(questioner: Player, answerer: Player) throws {
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
}
