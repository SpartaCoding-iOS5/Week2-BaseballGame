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
        case zeroIsFirst
        case notInteger
        case levelError
        case invalidInput
        
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
            case .zeroIsFirst:
                return "0이 가장 처음 에 올 수 없습니다."
            case .notInteger:
                return "정수 입력이 아닙니다."
            case .levelError:
                return "유효하지 않은 레벨입니다. 1~6까지를 선택해주세요."
            case .invalidInput:
                return "잘못된 입력입니다."
            }
        }
    }
}
