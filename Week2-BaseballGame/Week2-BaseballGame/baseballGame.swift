//
//  baseballGame.swift
//  Week2-BaseballGame
//
//  Created by CHYUN on 11/5/24.
//


class BaseballGame {
    
    enum GameMessage: String {
        case start = "Game Start",
             input = "please input your number",
             end = "Game End",
             strike = "Strike",
             ball = "Ball",
             out = "Out"
    }

    
    private var answer: [Int] = []
    private let numberOfAnsewer = 3
    
    func startNewSet() {
        
        /**
         * answer의 count가 numberOfAnswer가 될 때까지 0에서 9이내의 랜덤 Int 추출 반복
         * 동일한 수가 없을 때만 append
         **/
        while answer.count < numberOfAnsewer {
            let randomNumber = Int.random(in: 0...9)
            if !answer.contains(randomNumber) {
                answer.append(randomNumber)
            }
        }
        print(GameMessage.start.rawValue)
        print(answer) //test
    }
}
