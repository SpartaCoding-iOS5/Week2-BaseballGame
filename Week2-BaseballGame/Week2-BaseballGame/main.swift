import Foundation

func startGame() {
    print("레벨을 선택하세요 (1, 2, 4, 5, 6):")
    
    do {
        if let input = readLine(), let level = Int(input) {
            var game: BaseballGame = BaseballGame()
            var questioner: Player = Computer()
            var answerer: Player = User()
            
            switch level {
            case 1:
                game = BaseballGameLevel1()
            case 2:
                game = BaseballGameLevel2()
            case 3:
                game = BaseballGameLevel3()
            case 4:
                break
            case 5:
                break
            case 6:
                break
            default:
                print("유효하지 않은 레벨입니다. 1~6까지를 선택해주세요.")
            }
            
            try game.startGame(questioner: questioner, answerer: answerer)
        } else {
            print("잘못된 입력입니다.")
        }
    } catch let error {
        print(error.localizedDescription)
    }
}

// 게임 시작
startGame()
