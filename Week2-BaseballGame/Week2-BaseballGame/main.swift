import Foundation

func startGame() {
    print("레벨을 선택하세요 (1, 2, 3, 4, 5, 7): ", terminator: "")
    print("ㄴ")
    
    if let input = readLine(), let level = Int(input) {
        switch level {
        case 1:
            levelOne()
        case 2:
            let game = BaseballGameLv2()
            game.startGame()
        case 3:
            let game = BaseballGameLv3()
            game.startGame()
        case 4:
            let game = BaseballGameLv4()
            game.startGame()
        case 5:
            let game = BaseballGameLv5()
            game.startGame()
        case 6:
            let game = BaseballGameLv6()
            game.startGame()
        case 7:
            let answerCreator = AnswerCreatorLv7()
            let game = BaseballGameLv7(answerCreator: answerCreator)
            game.startGame()
        default:
            print("유효하지 않은 레벨입니다. 1~7까지를 선택해주세요.")
        }
    } else {
        print("잘못된 입력입니다.")
    }
}

// 게임 시작
startGame()
