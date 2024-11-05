// Command Line Tool Project file for BaseballGame Lv_2 - Models/AnswerCreator
// 작성일: 2024.11.05 (화요일)
//
// 작성자: Jamong
// 이 파일은 Lv_2의 정답을 생성하는 AnswerCreatorLv2 클래스를 정의한다.
// AnswerCreatorLv2는 1에서 9까지의 서로 다른 세 자리 숫자를 생성한다.

import Foundation

///  야구 게임에 필요한 세 자리 정답을 생성하는 클래스
///  정답은 1부터 9까지의 중복되지 않은 세 개의 숫자로 구성
class AnswerCreatorLv2 {
    
    /// - Returns: 1부터 9까지의 중복되지 않은 서로 다른 정수 3개로 구성된 배열
    static func create() -> [Int] {
        var answerSet: Set<Int> = []
        while answerSet.count < 3 {
            let randomNum = Int.random(in: 1...9)
            answerSet.insert(randomNum)
        }
        return Array(answerSet)
    }
}
