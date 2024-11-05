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
             outMessage = "Out"
        
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
    
    private var answer: [Int] = []
    private let numberOfAnswer = 3
    private var playerInput: [Int?] = []
    private let rangeOfAnswer = 1...9
    

    func startNewSet() {
        
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
    
    func getPlayerInput() {
        
        GameMessage.printGuidanceMessage(message: .requireInputMessage)
        
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
        
        var tempInput = readLine()!
        tempInput.replace(" " , with: "")
        
        do {
            // 이상 없이 정상 진행될 경우
            playerInput = try checkError(playerInput: tempInput)
            
            var strikeCount = 0
            var ballCount = 0
            for index in playerInput.startIndex...playerInput.count - 1 {
                answer[index] == playerInput[index]! ? strikeCount += 1 : nil
                answer.contains(playerInput[index]!) && answer[index] != playerInput[index]! ? ballCount += 1 : nil
            }
            
            print("\(strikeCount) \(GameMessage.strikeMessage.rawValue) \(ballCount) \(GameMessage.ballMessage.rawValue)")
            
            
        } catch InputError.inputCountError {
            InputError.printErrorMessage(error: InputError.inputCountError)
            
        } catch InputError.invalidInputError {
            InputError.printErrorMessage(error: InputError.invalidInputError)
            
        } catch InputError.zeroInputError {
            InputError.printErrorMessage(error: InputError.zeroInputError)
            
        } catch InputError.duplicateValueError {
            InputError.printErrorMessage(error: InputError.duplicateValueError)
            
        } catch {
            InputError.printErrorMessage(error: InputError.unknownError)
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
