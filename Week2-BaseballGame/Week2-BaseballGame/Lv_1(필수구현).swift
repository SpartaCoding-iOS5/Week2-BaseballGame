// Lv 1 (11/04 까지)
// 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
// 정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)

import Foundation

func levelOne() {
    
    // 정답 생성
    let answerArray = randomAnswer()
    print("야구 게임 시작")


    while true {
        print("세 자리 숫자를 입력하세요:")
        
        // 1. 제한사항: 세자리 숫자
        guard let input = readLine(), input.count == 3 else {
            print("제한사항: 세 자리 숫자를 입력해주세요.")
            continue
        }
        
        // 입력받은 3개의 수를 배열에 잘라서 넣기
        var userAnswerArray: [Int] = []
        for char in input {
            // 2. 제한사항: 숫자만 입력하기
            guard let userAnswerChar = Int(String(char)) else {
                print("제한사항: 아라비아 숫자로 입력해주세요.")
                continue
            }
            userAnswerArray.append(userAnswerChar)
        }
        
        // 3. 제한사항: 서로 다른 임의의 세자리 숫자
        guard Set(userAnswerArray).count == 3 else {
            print("제한사항: 중복된 숫자가 존재합니다.")
            continue
        }
        
        // 판정 시작
        let (strike, ball) = evaluateBallCount(userData: userAnswerArray, answerData: answerArray)
        print("\(strike) 스트라이크, \(ball) 볼")
        
        // 정답 체크
        if strike == 3 {
            print("정답을 맞추셨습니다.")
            break
        }
    }
    
    // 정답생성(중복값을 없애고 배열로 반환)
    func randomAnswer() -> [Int] {
        var answerSet: Set<Int> = []
        while answerSet.count != 3 {
            let randomNum = Int.random(in: 1...9)
            answerSet.insert(randomNum)
        }
        
        return Array(answerSet)
    }
    
    // 비교판정 함수
    func evaluateBallCount(userData: [Int], answerData: [Int]) -> (Int, Int) {
        var strike = 0
        var ball = 0
        
        for index in userData.indices {
            if userData[index] == answerData[index] {
                strike += 1
            }
            else if answerData.contains(userData[index]) {
                ball += 1
            }
        }
        return (strike, ball)
    }
}
