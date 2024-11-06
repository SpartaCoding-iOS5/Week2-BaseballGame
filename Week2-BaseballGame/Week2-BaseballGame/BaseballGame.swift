//
//  baseballGame.swift
//  Week2-BaseballGame
//
//  Created by CHYUN on 11/5/24.
//


class BaseballGame {
    
    // 기록 매니저
    private var recordManager: RecordManager
    init(recordManager: RecordManager) {
        self.recordManager = recordManager
    }
    // 정답 개수
    private let numberOfAnswer = 3
    // 정답 범위
    private let rangeOfAnswerWithZero = 0...9
    private let rangeOfAnswerWithoutZero = 1...9
    // 게임 상태
    private var gameStatus: GameStatus = .on {
        willSet(newStatus) {
            switch newStatus {
            case .on : GameMessage.printGuidanceMessage(message: GameMessage.welcomeMessage)
            case .off : GameMessage.printGuidanceMessage(message: GameMessage.gameEndMessage)
            }
        }
    }
    
    // 게임 시작
    func startGame() {
        
        gameStatus = .on
        commandLoop : while true {
            let command = readLine()!.replacingOccurrences(of: " ", with: "")
            
            switch command {
            case "1":
                playGame()
                break commandLoop
            case "2":
                recordManager.showRecord()
                GameMessage.printGuidanceMessage(message: GameMessage.inputAgainMessage)

            case "3":
                gameStatus = .off
                break commandLoop
            default :
                InputError.printErrorMessage(error: .invalidInputError)
                GameMessage.printGuidanceMessage(message: GameMessage.inputAgainMessage)
            }
        }
    }
    

    func playGame() {
        
        // 랜덤 값 받아오기
        let answer = newGame()
        var score = Score()
        var tryCount = 0
        
        
        while gameStatus == .on {
            
            let playerInput = getPlayerInput()
            
            do {
                // 예외 상황 처리, 예외 없을 경우 배열로 값 받아오기
                let playerInputAsArray = try checkError(input: playerInput)
                
                for index in playerInputAsArray[0]...playerInputAsArray.count - 1 {
                    let number = playerInputAsArray[index]
                    let matchedAnswer = answer[index]
                    
                    // 1.
                    matchedAnswer == number ? score.strikeCount += 1 : nil
                    answer.contains(playerInputAsArray[index]) && answer[index] != playerInputAsArray[index] ? score.ballCount += 1 : nil
                    !answer.contains(playerInputAsArray[index]) ? score.outCount += 1 : nil
                }
                
                if score.strikeCount == numberOfAnswer {
                    GameMessage.printGuidanceMessage(message: GameMessage.hitMessage)
                    recordManager.recordSet(tryCount: tryCount + 1)
                    startGame()
                    
                } else if score.outCount == numberOfAnswer {
                    GameMessage.printGuidanceMessage(message: GameMessage.outMessage)
                } else {
                    print("\(score.strikeCount) \(GameMessage.strikeMessage) \(score.ballCount) \(GameMessage.ballMessage)")
                }
                
                score = Score()
                tryCount += 1
                
                
            } catch InputError.inputCountError {
                InputError.printErrorMessage(error: .inputCountError)
                
            } catch InputError.invalidInputError {
                InputError.printErrorMessage(error: .invalidInputError)
                
            } catch InputError.zeroInputError {
                InputError.printErrorMessage(error: .zeroInputError)
                
            } catch InputError.duplicateValueError {
                InputError.printErrorMessage(error: .duplicateValueError)
                
            } catch {
                InputError.printErrorMessage(error: .unknownError)
            }
        }
        
    }
    
    
    // 랜덤 값 추출
    private func newGame() -> [Int] {
        var answer: [Int] = []
        var questionBoxes = ""
        var range = rangeOfAnswerWithoutZero
        
        while answer.count < numberOfAnswer {
            
            let randomNumber = Int.random(in: range)
            if !answer.contains(randomNumber) {
                answer.append(randomNumber)
                range = rangeOfAnswerWithZero // 랜덤 범위 - 0을 포함한 범위로 변경
                questionBoxes.append("[ ? ] ")
            }
        }
        
        GameMessage.printGuidanceMessage(message: GameMessage.gemeStartMessage)
        print(questionBoxes)
        
        print(answer) //test
        return answer
    }
    
    // 입력 값 받아와서 필요한 처리 후 리턴
    private func getPlayerInput() -> String {
        GameMessage.printGuidanceMessage(message: GameMessage.requireInputMessage)
        var tempInput = readLine()!
        tempInput.replace(" " , with: "")
        return tempInput
    }
    
    
    // 예외 상황 체크
    private func checkError(input: String) throws -> [Int] {
        
        // 한 자씩 파악하기 위해 배열로 쪼개기
        let inputAsStringArray = input.split(separator: "")
        
        // 1. 입력 값 개수가 요구치와 다른지 체크
        guard inputAsStringArray.count == numberOfAnswer else {
            throw InputError.inputCountError
        }
        
        // String 배열 -> Int 배열
        var inputAsIntArray = inputAsStringArray.map({ Int($0) })
        
        // 2. String값 Int로 바꿀경우 nil, 숫자 아닌 값 입력되었는지 체크
        guard !inputAsIntArray.contains(nil) else {
            throw InputError.invalidInputError
        }
        
        // 3. 0이 첫 자리에 입력되었는지 체크
        guard inputAsIntArray.first != 0 else {
            throw InputError.zeroInputError
        }
        
        // 4. 중복 값 입력되었는지 체크
        guard Set(inputAsIntArray).count == inputAsIntArray.count else {
            throw InputError.duplicateValueError
        }
        
        // 모든 예외 상황이 아닐 경우 값비 교를 위한 배열 리턴, 위에서 nil 체크 완료
        return inputAsIntArray.map({ $0! })
        
    }
    
}
