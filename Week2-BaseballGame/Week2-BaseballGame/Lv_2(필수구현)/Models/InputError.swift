// Command Line Tool Project file for BaseballGame Lv_2 - Models/InputError
// 작성일: 2024.11.05 (화요일)
//
// 작성자: Jamong
// 이 파일은 Lv_2의 입력 검증 과정에서 발생할 수 있는 오류를 정의하는 InputErrorLv2 열거형을 포함한다.

import Foundation

/// 입력 오류를 처리하기 위한 열거형
/// 잘못된 길이, 숫자가 아닌 문장, 중복된 숫자에 대한 오류를 정의한다.
enum InputErrorLv2: Error {
    case invalidLength      // 입력이 세 자리 숫자가 아닌 경우
    case notNumber          // 입력에 숫자가 아닌 문자가 포함된 경우
    case duplicateNumbers   // 입력에 중복된 숫자가 있는 경우
}
