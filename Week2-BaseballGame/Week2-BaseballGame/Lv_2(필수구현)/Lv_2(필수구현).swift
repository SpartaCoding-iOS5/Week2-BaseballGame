// Lv 2 (11/06 까지)

/*
 - 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다
 - 힌트는 야구용어인 **볼**과 **스트라이크**입니다.
 - 같은 자리에 같은 숫자가 있는 경우 **스트라이크**, 다른 자리에 숫자가 있는 경우 **볼**입니다
 - ex) 정답 : 456 인 경우
 - 435를 입력한 경우 → 1스트라이크 1볼
 - 357를 입력한 경우 → 1스트라이크
 - 678를 입력한 경우 → 1볼
 - 123를 입력한 경우 → Nothing
 - 만약 올바르지 않은 입력값에 대해서는 오류 문구를 보여주세요
 - 3자리 숫자가 정답과 같은 경우 게임이 종료됩니다
 - 실행 예시(정답 : 456)13123213
 */

import Foundation

struct BaseballGameLevel2 {
    func startGame() throws {
        let computerAnswer = try Computer().answer()
        
        while true {
            print("숫자를 입력하세요")
            let userAnswer = try User().answer()
            if userAnswer == computerAnswer {
                print("정답입니다!")
                break
            } else {
                giveHint(computerAnswer: computerAnswer, userAnswer: userAnswer)
            }
        }
    }
    
    private func giveHint(computerAnswer: Int, userAnswer: Int) {
        let userAnswerArr = Array(String(userAnswer))
        let computerAnswerArr = Array(String(computerAnswer))
        
        var strikes = 0
        var balls = 0
        
        for index in userAnswerArr.indices {
            if userAnswerArr[index] == computerAnswerArr[index] {
                strikes += 1
            } else if computerAnswerArr.contains(userAnswerArr[index]) {
                balls += 1
            }
        }
        
        switch (strikes, balls) {
        case (0, 0):
            print("Nothing")
        case (0, _):
            print("\(balls)볼")
        case (_, 0):
            print("\(strikes)스트라이크")
        case (_, _):
            print("\(strikes)스트라이크 \(balls)볼")
        }
    }
}

func levelTwo() {
    do {
        print("<게임을 시작합니다>")
        try BaseballGameLevel2().startGame()
    } catch let error {
        print(error.localizedDescription)
    }
}
