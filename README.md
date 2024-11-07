# 숫자 야구 게임 과제 (Week 2)
- 사용자가 서로 다른 숫자로 구성된 3자리 숫자를 입력하여, 컴퓨터가 제시하는 숫자를 맞추는 숫자 게임 입니다.
- 정답과의 일치율에 따라 스트라이크, 볼, Nothing 등의 힌트가 주어집니다.
- 게임 기록을 확인할 수 있습니다. 

## 코드 구조
- BaseballGame
```swift
class BaseballGame {
    func startGame(questioner: Player, answerer: Player) throws {
        return
    }
}
```
- Player
```swift
protocol Player {
    func answer() throws -> Int
}
```
- 위 두 개의 클래스와 프로토콜이 객체를 추상화하는 가장 작은 단위이다.
- 각 레벨별로 수행되는 게임을 제공하는 객체는 BaseballGame 객체를 상속받는다.
- Level2 객체는 Level1의 BaseballGame 객체를 상속받아 기능을 확장한다.
```swift
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

class BaseballGameLevel2: BaseballGameLevel1 {
    override func startGame(questioner: any Player, answerer: any Player) throws {
        let question = try questioner.answer()

        print("<게임을 시작합니다>")
        while true {
            print("숫자를 입력하세요")
            let userAnswer = try answerer.answer()
            if userAnswer == question {
                print("정답입니다!")
                break
            } else {
                giveHint(computerAnswer: question, userAnswer: userAnswer)
            }
        }
    }
    
    func giveHint(computerAnswer: Int, userAnswer: Int) {
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
```
- 입력된 레벨에 따라 적합한 BaseballGame 레벨 구현체와 Player 구현체를 제공해 작업을 수행한다.
```swift
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
```

## 고민한 점
- BaseballGame -> BaseballGameLevel1 -> ... -> BaseballGameLevel6까지 상속이 이어지도록 구현하였다.
- 상위에서 구현한 기능을 재사용하고, 필요한 경우 재정의해 사용해 코드 중복을 줄이고 확장성을 높이고 싶었음.
- level4 이후에는 메뉴가 있고, 그 선택에 따라 실행될 함수가 달라진다.
```swift
class BaseballGameLevel4: BaseballGameLevel3 {
    override func startGame(questioner: any Player, answerer: any Player) throws {
        print("환영합니다! 원하시는 번호를 입력해주세요")
        
        while true {
            print("1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            
            if let input = readLine(), let num = Int(input) {
                switch num {
                // 상속받을 때 마다 startGame 오버라이딩 하고, 지금 보는 것과 같은 코드 동일하게 작성해야 함
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
}
```
- 이 때 레벨이 증가할 때 마다 각각의 case에 함수를 작성해 주어야 한다.
- 이 때 startGame 함수만을 계속 오버라이딩해서 사용하게 되면 중복 코드의 발생 가능성이 높아진다.
- 따라서 각각의 case에 대한 함수를 분리하고, 해당 함수를 오버라이딩해 사용하도록 하여 코드 중복을 줄이고자 하였다.
```swift
class BaseballGameLevel4: BaseballGameLevel3 {
    override func startGame(questioner: any Player, answerer: any Player) throws {
        print("환영합니다! 원하시는 번호를 입력해주세요")
        
        outerLoop: while true {
            print("1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            
            if let input = readLine(), let num = Int(input) {
                switch num {
                case 1:
                    try proceedGame(questioner: questioner, answerer: answerer)
                    
                case 2:
                    showRecord()
                    
                case 3:
                    endGame()
                    break outerLoop
                    
                default:
                    break
                }
            }
        }
    }
    
    // 아래 함수들만 오버라이딩하면 됨
    func proceedGame(questioner: Player, answerer: Player) throws {
        try super.startGame(questioner: questioner, answerer: answerer)
    }
    
    func showRecord() {}
    
    func endGame() {}
}
```

