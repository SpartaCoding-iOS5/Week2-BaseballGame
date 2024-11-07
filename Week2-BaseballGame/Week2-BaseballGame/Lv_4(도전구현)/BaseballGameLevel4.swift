//
//  BaseballGameLevel4.swift
//  Week2-BaseballGame
//
//  Created by 권승용 on 11/7/24.
//

class BaseballGameLevel4: BaseballGameLevel3 {
    override func startGame(questioner: any Player, answerer: any Player) throws {
        
        print("환영합니다! 원하시는 번호를 입력해주세요")
        print("1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
        
        if let input = readLine(), let num = Int(input) {
            switch num {
            case 1:
                try super.startGame(questioner: questioner, answerer: answerer)
            case 2:
                break
                
            case 3:
                break
                
            default:
                break
            }
        }
    }
}
