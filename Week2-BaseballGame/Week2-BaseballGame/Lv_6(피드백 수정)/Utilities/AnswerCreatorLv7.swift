import Foundation

class AnswerCreatorLv7 {
    static func create() -> [Int] {
        var answerSet: Set<Int> = []
        while answerSet.count < 3 {
            let randomNum = Int.random(in: 0...9)
            answerSet.insert(randomNum)
        }
        var answerArray = Array(answerSet)
        if answerArray[0] == 0 {
            answerArray.swapAt(0, Int.random(in: 1..<answerArray.count))
        }
        return answerArray
    }
}
