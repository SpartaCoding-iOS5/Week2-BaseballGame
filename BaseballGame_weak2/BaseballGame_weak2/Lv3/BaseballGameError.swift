//
//  ErrorType.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/4/24.
//

import Foundation

/// 숫자 야구게임을 진행하며 발생하는 오류
enum BaseballGameError: Error, LocalizedError {
    case duplicateValue
    case InputError
    case enterValueOfZero
    
    var errorDescription: String {
        switch self {
        case .duplicateValue:
            return "(중복된 값이 있습니다)"
        case .InputError:
            return "(정답과 입력한 숫자의 수가 다릅니다)"
        case .enterValueOfZero:
            return "(첫번째 입력값이 0이면 안됩니다)"
        }
    }
}
