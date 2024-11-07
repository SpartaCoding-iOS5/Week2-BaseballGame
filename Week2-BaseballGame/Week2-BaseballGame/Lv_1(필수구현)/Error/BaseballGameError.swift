//
//  BaseballGameError.swift
//  Week2-BaseballGame
//
//  Created by 권승용 on 11/7/24.
//

import Foundation

enum BaseballGameError {
    enum InputError: LocalizedError {
        case notString
        case countNotMatching
        case duplicatedNumber
        case zeroDetected
        case notInteger
        
        var errorDescription: String? {
            switch self {
            case .notString:
                return "문자열 입력이 아닙니다."
            case .duplicatedNumber:
                return "중복된 숫자가 있습니다."
            case .countNotMatching:
                return "입력 수의 갯수가 다릅니다."
            case .zeroDetected:
                return "0은 입력할 수 없습니다."
            case .notInteger:
                return "정수 입력이 아닙니다."
            }
        }
    }
}
