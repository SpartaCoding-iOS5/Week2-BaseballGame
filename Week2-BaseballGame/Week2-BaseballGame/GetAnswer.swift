
// 정답 값을 생성하기 위한 클래스
class GetAnswer {
    // 정답 값을 넣을 배열 생성
    var answerArray:[Int] = []
    
    // 랜덤값 생성 메서드
    func getRandomValue() -> Int {
        return Int.random(in: 0...9)
    }
    
    // 정답 생성 메서드
    func getAnswser()  {
        // 중복 값을 제거해주고 3개의 임의의 수를 저장(첫번째 자리에 "0"이 오면 제거)
        while answerArray.count < 3 {
            let randomValue = getRandomValue()
            if !answerArray.contains(randomValue) {
                answerArray.append(randomValue)
            }
            if answerArray[0] == 0 {
                answerArray.removeFirst()
            }
        }
    }
}
