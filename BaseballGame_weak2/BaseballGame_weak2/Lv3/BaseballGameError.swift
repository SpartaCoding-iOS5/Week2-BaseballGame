//
//  ErrorType.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/4/24.
//

import Foundation

/// 숫자 야구게임을 진행하며 발생하는 오류
enum BaseballGameError: String, Error {
    case duplicateValue = "(중복된 값이 있습니다)"
    case InputError = "(정답과 입력한 숫자의 수가 다릅니다)"
    case enterValueOfZero = "(첫번째 입력값이 0이면 안됩니다)"
}
