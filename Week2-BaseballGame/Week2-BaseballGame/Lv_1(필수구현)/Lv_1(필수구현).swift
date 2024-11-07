// Lv 1 (11/04 까지)
// 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
// 정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)

import Foundation

func levelOne() {
    
    struct GetAnswer {
        var setRandomValue:Set<Int> = []
        var answerArray:[Int] = []

        // 랜덤 값을 생성하는 함수
        func getRandomValue() -> Int {
            return Int.random(in: 1...9)
        }
    }

    var answer = GetAnswer()

    // 중복 값을 제거해주고 3개의 임의의 수를 저장
    while answer.setRandomValue.count != 3 {
        answer.setRandomValue.insert(answer.getRandomValue())
    }
    // set에 저장된 랜덤 값을 배열에 다시 추가
    for i in answer.setRandomValue {
        answer.answerArray.append(i)
    }
    print(answer.answerArray)
}




