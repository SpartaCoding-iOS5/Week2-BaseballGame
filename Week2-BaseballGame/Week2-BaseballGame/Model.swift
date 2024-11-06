//
//  Model.swift
//  Week2-BaseballGame
//
//  Created by CHYUN on 11/6/24.
//

enum GameStatus: Int {
    case on = 1,
         off = 0
}


enum GameMessage {
    static let welcomeMessage = "Welcome! Please enter the number to execute. \n 1. Game Start 2. Record 3. Exit"
    static let gemeStartMessage = "*** Game Start ***"
    static let requireInputMessage = "Please enter the numbers for each question mark in order, then press Enter."
    static let gameEndMessage = "***Game End***"
    static let noRecordMessage = "No Record"
    static let inputAgainMessage = "Input the number to execute again."
    static let strikeMessage = "Strike"
    static let ballMessage = "Ball"
    static let outMessage = "Out!"
    static let hitMessage = "Hit!"
    
    static func printGuidanceMessage(message: String) {
        print(message)
    }
}

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
            message = "The first position cannot contain a zero."
        case duplicateValueError:
            message = "There are duplicate values."
        case unknownError:
            message = "There are unknown errors."
        }
        
        print(message)
    }
}


struct Score {
    var strikeCount = 0
    var ballCount = 0
    var outCount = 0
}
