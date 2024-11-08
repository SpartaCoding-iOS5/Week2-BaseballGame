import Foundation

func startGame() {
    print("레벨을 선택하세요 (1, 2, 3, 4, 5, 6):")
    
    do {
        if let input = readLine(), let level = Int(input) {
            var game: BaseballGame = BaseballGame()
            let questioner: Player = Computer()
            var answerer: Player = User()
            
            switch level {
            case 1:
                game = BaseballGameLevel1()
            case 2:
                game = BaseballGameLevel2()
            case 3:
                game = BaseballGameLevel3()
                answerer = UserOverLevel3()
            case 4:
                game = BaseballGameLevel4()
                answerer = UserOverLevel3()
            case 5:
                game = BaseballGameLevel5()
                answerer = UserOverLevel3()
            case 6:
                game = BaseballGameLevel6()
                answerer = UserOverLevel3()
            default:
                throw BaseballGameError.InputError.levelError
            }
            
            try game.startGame(questioner: questioner, answerer: answerer)
        } else {
            throw BaseballGameError.InputError.invalidInput
        }
    } catch let error {
        print(error.localizedDescription)
    }
}

// 게임 시작
startGame()
