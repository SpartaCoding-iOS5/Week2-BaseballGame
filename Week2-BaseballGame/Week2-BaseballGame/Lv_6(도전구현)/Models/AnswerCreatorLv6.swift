// Command Line Tool Project file for BaseballGame Lv_6 - Models/AnswerCreator
// 작성일: 2024.11.07 (목요일)
//
// 작성자: Jamong
// 이 파일은 Lv_6의 정답을 생성하는 AnswerCreatorLv6 클래스를 정의한다.
// AnswerCreatorLv6는 0에서 9까지의 서로 다른 세 자리 숫자를 생성한다.

import Foundation

///  야구 게임에 필요한 세 자리 정답을 생성하는 클래스
///  정답은 0부터 9까지의 중복되지 않은 세 개의 숫자로 구성
class AnswerCreatorLv6 {
    
    /// - Returns: 0부터 9까지의 중복되지 않은 서로 다른 정수 3개로 구성된 배열
    static func create() -> [Int] {
        var answerSet: Set<Int> = []
        while answerSet.count < 3 {
            let randomNum = Int.random(in: 0...9)
            answerSet.insert(randomNum)
        }
        var answerArray = Array(answerSet)
        
        // 맨 앞이 0일 경우 맨앞과 두번쨰 또는 세번째 자리와 랜덤 스왑
        if answerArray[0] == 0 {
            answerArray.swapAt(0, Int.random(in: 1...2))
        }
        
        return answerArray
    }
}
