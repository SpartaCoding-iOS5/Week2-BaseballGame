//
//  baseballGame.swift
//  Week2-BaseballGame
//
//  Created by CHYUN on 11/5/24.
//


class BaseballGame {
    
    // 기록 매니저
    private var recordManager: RecordManager
    private var printManager: PrintManager
    init(recordManager: RecordManager, printManager: PrintManager) {
        self.recordManager = recordManager
        self.printManager = printManager
    }


    // 게임 상태
    private var gameStatus: GameStatus = .on {
        willSet(newStatus) {
            switch newStatus {
            case .on : printManager.printGuideance(guide: Guidance.welcome)
            case .off : printManager.printGuideance(guide: Guidance.gameEnd)
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
                printManager.printGuideance(guide: Guidance.inputAgain)

            case "3":
                gameStatus = .off
                break commandLoop
            default :
                printManager.printError(error: InputError.invalidInputError)
                printManager.printGuideance(guide: Guidance.inputAgain)
            }
        }
    }
    

    func playGame() {

        let answer = newGame() // 랜덤 값 받아오기
        var score = Score()
        var tryCount = 0
        
        
        while gameStatus == .on {
            
            // 플레이어에게 값 받기
            let playerInput = getPlayerInput()
            
            do {
                // 예외 없을 경우
                let playerInputAsArray = try checkError(input: playerInput)
                
                score = calculateScore(playerInput: playerInputAsArray, answer: answer)
                
                if score.strikeCount == GameConfig.numberOfAnswer {
                    printManager.printGuideance(guide: Guidance.hit)
                    recordManager.recordSet(tries: tryCount + 1)
                    startGame()
                } else if score.outCount == GameConfig.numberOfAnswer {
                    printManager.printGuideance(guide: Guidance.out)
                } else {
                    print("\(score.strikeCount) \(Guidance.strike) \(score.ballCount) \(Guidance.ball)")
                }
                
                score = Score()
                tryCount += 1
                
                // 예외 경우
            } catch InputError.inputCountError {
                printManager.printError(error: InputError.inputCountError)
                
            } catch InputError.invalidInputError {
                printManager.printError(error: InputError.invalidInputError)
                
            } catch InputError.zeroInputError {
                printManager.printError(error: InputError.zeroInputError)
                
            } catch InputError.duplicateValueError {
                printManager.printError(error: InputError.duplicateValueError)
            } catch {
                printManager.printError(error: InputError.unknownError)
            }
        }
        
    }
    
    
    private func calculateScore(playerInput: [Int], answer: [Int]) -> Score {
        var score = Score()
        for (index, number) in playerInput.enumerated() {
            if answer [index] == number {
                score.strikeCount += 1
            } else if answer.contains(number) {
                score.ballCount += 1
            } else {
                score.outCount += 1
            }
        }
        return score
    }
    
    
    // 랜덤 값 추출
    private func newGame() -> [Int] {
        var answer: [Int] = []
        var questionBoxes = ""
        var range = GameConfig.rangeOfAnswerWithoutZero
        
        while answer.count < GameConfig.numberOfAnswer {
            
            let randomNumber = Int.random(in: range)
            if !answer.contains(randomNumber) {
                answer.append(randomNumber)
                range = GameConfig.rangeOfAnswerWithZero // 랜덤 범위 - 0을 포함한 범위로 변경
                questionBoxes.append("[ ? ] ")
            }
        }
        
        printManager.printGuideance(guide: Guidance.gameStart)
        print(questionBoxes)
        
        print(answer) //test
        return answer
    }
    
    // 입력 값 받아와서 필요한 처리 후 리턴
    private func getPlayerInput() -> String {
        printManager.printGuideance(guide: Guidance.requireInput)
        return readLine()?.trimmingCharacters(in: .whitespaces) ?? ""
    }
    
    
    // 예외 상황 체크
    private func checkError(input: String) throws -> [Int] {
        
        // 한 자씩 파악하기 위해 배열로 쪼개기
        let inputAsStringArray = input.split(separator: "")
        
        // 1. 입력 값 개수가 요구치와 다른지 체크
        guard inputAsStringArray.count == GameConfig.numberOfAnswer else {
            throw InputError.inputCountError
        }
        
        // String 배열 -> Int 배열
        let inputAsIntArray = inputAsStringArray.map({ Int($0) })
        
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
