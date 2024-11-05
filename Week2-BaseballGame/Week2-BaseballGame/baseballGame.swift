//
//  baseballGame.swift
//  Week2-BaseballGame
//
//  Created by CHYUN on 11/5/24.
//

class BaseballGame {
    
    enum GameMessage: String {
        case gemeStartMessage = "Game Start",
             requireInputMessage = "Please enter the numbers for each question mark in order, then press Enter.",
             gameEndMessage = "Game End",
             strikeMessage = "Strike",
             ballMessage = "Ball",
             outMessage = "Out!",
             hitMessage = "Hit!"
        
        static func printGuidanceMessage(message: GameMessage) {
            print(message.rawValue)
        }
    }
    
    enum InputError: Error {
        case inputCountError,
             invalidInputError,
             zeroInputError,
             duplicateValueError,
             unknownError
        
        static func printErrorMessage(error: InputError) {
            
            var message = ""
            
            switch error {
            case inputCountError:
                message = "The number of inputs is insufficient."
            case invalidInputError:
                message = "Invalid input."
            case zeroInputError:
                message = "Zero is not allowed."
            case duplicateValueError:
                message = "There are duplicate values."
            case unknownError:
                message = "There are unknown errors."
            }
            
            print(message)
        }
    }
    
    enum GameStatus: Int {
        case on = 1,
             off = 0
    }
    
    private var answer: [Int] = []
    private let numberOfAnswer = 3
    private let rangeOfAnswer = 1...9
    private var gameStatus = GameStatus.off
    

    func startNewSet() {
        
        gameStatus = .on
        
        var questionBoxes = ""
        
        while answer.count < numberOfAnswer {
            let randomNumber = Int.random(in: rangeOfAnswer)
            if !answer.contains(randomNumber) {
                answer.append(randomNumber)
                questionBoxes = questionBoxes + "[ ? ] "
            }
        }
        
        GameMessage.printGuidanceMessage(message: .gemeStartMessage)
        print(questionBoxes)
    
        print(answer) //test
    }
    
    func getPlayerInput() -> String {
        GameMessage.printGuidanceMessage(message: .requireInputMessage)
        var tempInput = readLine()!
        tempInput.replace(" " , with: "")
        return tempInput
    }
    
    func playGame() {
        
        /** 값 비교 전 체크 필요
         * [ 해결 가능 - 제일 먼저 체크 ]
         * 1. 공백 문자 삽입 여부
         * -------------> 공백 제외 후 비교
         *
         * [ 입력 개수 파악 ]
         * 2. 입력 값 개수가 numberOfAnswer보다 부족 (입력 값 없을 경우 포함)
         *
         * [ 올바르지 않은입력 값 파악 ]
         * 3. Int 값 외
         * 4. 0 입력
         * 5. 중복 숫자 입력
         * -------------> 다시 입력 받기
         **/
        
        var strikeCount = 0
        var ballCount = 0
        var outCount = 0

        
        gameLoop : while gameStatus == .on {
    
            let playerInput = getPlayerInput()
            
            do {
                // 이상 없이 정상 진행될 경우
                let playerInputAsArray = try checkError(playerInput: playerInput)
                
                for index in playerInputAsArray.startIndex...playerInputAsArray.count - 1 {
                    answer[index] == playerInputAsArray[index]! ? strikeCount += 1 : nil
                    answer.contains(playerInputAsArray[index]!) && answer[index] != playerInputAsArray[index]! ? ballCount += 1 : nil
                    !answer.contains(playerInputAsArray[index]!) ? outCount += 1 : nil
                }
                
                print("strikeCount : \(strikeCount), ballCount : \(ballCount), outCount : \(outCount)")

                if strikeCount == playerInput.count {
                    GameMessage.printGuidanceMessage(message: .hitMessage)
                    gameStatus = .off
                } else if outCount == playerInput.count {
                    GameMessage.printGuidanceMessage(message: .outMessage)
                } else {
                    print("\(strikeCount) \(GameMessage.strikeMessage.rawValue) \(ballCount) \(GameMessage.ballMessage.rawValue)")
       
                }
      
                
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

    
    private func checkError(playerInput: String) throws -> [Int?] {
        
        let inputAsStringArray = playerInput.split(separator: "")
        
        guard inputAsStringArray.count == numberOfAnswer else {
            throw InputError.inputCountError
        }
        
        let inputAsIntArray = inputAsStringArray.map({ Int($0) })
        
        guard !inputAsIntArray.contains(nil) else {
            throw InputError.invalidInputError
        }
        
        guard !inputAsIntArray.contains(0) else {
            throw InputError.zeroInputError
        }
        
        guard Set(inputAsIntArray).count == inputAsIntArray.count else {
            throw InputError.duplicateValueError
        }
        
        return inputAsIntArray
        
    }
    
}
