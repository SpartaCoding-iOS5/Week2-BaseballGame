import Foundation

func startGame() {
    print("레벨을 선택하세요 (1, 2, 4, 5, 6):")
    
    if let input = readLine(), let level = Int(input) {
        switch level {
        case 1:
            levelOne()
        case 2:
            levelTwo()
        case 3:
            levelThree()
        case 4:
            levelFour()
        case 5:
            levelFive()
        case 6:
            levelSix()
        default:
            print("유효하지 않은 레벨입니다. 1~6까지를 선택해주세요.")
        }
    } else {
        print("잘못된 입력입니다.")
    }
}

// 게임 시작
startGame()
