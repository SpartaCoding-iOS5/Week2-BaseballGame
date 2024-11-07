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

enum GameConfig {
    static let numberOfAnswer = 3
    static let rangeOfAnswerWithZero = 0...9
    static let rangeOfAnswerWithoutZero = 1...9
}


enum Guidance {
    case welcome,
         gameStart, gameEnd,
         requireInput, inputAgain,
         noRecord,
         strike, ball, out, hit
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
}


struct Score {
    var strikeCount = 0
    var ballCount = 0
    var outCount = 0
}
