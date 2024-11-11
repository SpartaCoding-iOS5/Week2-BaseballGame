import Foundation

class BaseballGameLv7: BaseballGameProtocolLv7 {
    var answer: [Int]
    var strike: Int = 0
    var ball: Int = 0
    var gameRecords: [Int] = []
    var gameAttempts: Int = 0
    
    private var answerCreator: AnswerCreatorLv7
    
    init(answerCreator: AnswerCreatorLv7) {
        self.answerCreator = answerCreator
        self.answer = AnswerCreatorLv7.create()
    }
    
    // 게임 시작을 안내하는 메서드
    func startGame() {
        while true {
            print(Constants.welcomeMessage)
            print(Constants.menuOptions)
            print("ㄴ ", terminator: "")
            
            guard let userInput = readLine(), let userIntInput = Int(userInput), (1...3).contains(userIntInput) else {
                print("유효하지 않은 입력으로 1, 2, 3 중 하나를 선택하세요.")
                continue
            }
            
            switch userIntInput {
            case 1:
                gameRecords.append(startBaseballGame())
            case 2:
                displayGameRecords()
            case 3:
                exitGame()
            default:
                continue
            }
        }
    }
    
    // 야구 게임의 핵심 로직
    func startBaseballGame() -> Int {
        resetGame()
        print("야구 게임을 시작합니다!")
        
        while true {
            let userInput = getUserInput()
            
            do {
                let (strikeCount, ballCount) = try checkAnswer(userInput: userInput)
                displayResult(strike: strikeCount, ball: ballCount)
                
                if strikeCount == 3 {
                    print("정답입니다!\n")
                    return gameAttempts
                }
                
            } catch let error as InputErrorLv7 {
                print(error.errorMessage)
            } catch {
                print("알 수 없는 오류가 발생했습니다.")
            }
        }
    }
    
    // 사용자 입력받기
    private func getUserInput() -> String {
        print("세 자리 숫자를 입력하세요: ", terminator: "")
        guard let userInput = readLine() else { return "" }
        return userInput
    }
    
    // 입력한 답을 확인하고 스트라이크와 볼을 계산
    func checkAnswer(userInput: String) throws -> (strike: Int, ball: Int) {
        guard let userNumber = Int(userInput), Constants.validNumberRange.contains(userNumber) else {
            throw InputErrorLv7.invalidLength
        }
        
        let userAnswerArray = try parseUserAnswer(userInput)
        
        guard Set(userAnswerArray).count == 3 else {
            throw InputErrorLv7.duplicateNumbers
        }
        
        gameAttempts += 1
        return evaluateBall(userAnswer: userAnswerArray, answer: answer)
    }
    
    private func parseUserAnswer(_ userInput: String) throws -> [Int] {
        var userAnswerArray: [Int] = []
        for char in userInput {
            guard let userAnswerChar = Int(String(char)) else {
                throw InputErrorLv7.notNumber
            }
            userAnswerArray.append(userAnswerChar)
        }
        return userAnswerArray
    }
    
    // 정답과 사용자의 입력 비교
    func evaluateBall(userAnswer: [Int], answer: [Int]) -> (strike: Int, ball: Int) {
        strike = 0
        ball = 0
        for index in userAnswer.indices {
            if userAnswer[index] == answer[index] {
                strike += 1
            } else if answer.contains(userAnswer[index]) {
                ball += 1
            }
        }
        return (strike, ball)
    }
    
    private func displayResult(strike: Int, ball: Int) {
        if strike == 0 && ball == 0 {
            print("아웃!")
        } else {
            print("\(strike)스트라이크 \(ball)볼")
        }
    }
    
    private func displayGameRecords() {
        print("< 게임 기록 보기 >")
        if gameRecords.isEmpty {
            print("기록이 없습니다.")
        } else {
            for (index, attempts) in gameRecords.enumerated() {
                print("\(index + 1)번째 게임: 시도 횟수 - \(attempts)")
            }
        }
        print("")
    }
    
    private func resetGame() {
        self.answer = AnswerCreatorLv7.create()
        self.strike = 0
        self.ball = 0
        self.gameAttempts = 0
    }
    
    private func exitGame() {
        print("숫자 야구 게임을 종료합니다.")
        exit(0)
    }
}
