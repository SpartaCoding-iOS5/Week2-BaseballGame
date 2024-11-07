
// 정답 값을 생성하기 위한 클래스
class GetAnswer {
    // 정답 값을 넣을 배열 생성
    var setRandomValue:Set<Int> = []
    var answerArray:[Int] = []
    
    // 랜덤값 생성 메서드
    func getRandomValue() -> Int {
        return Int.random(in: 1...9)
    }
    
    // 정답 생성 메서드
    func getAnswser()  {
        
        // 정답 리셋(나중에 추가 - 다른 새로운 게임 시작시)
        // setRandomValue = []
        // answerArray = []
        
        // 중복 값을 제거해주고 3개의 임의의 수를 저장
        while setRandomValue.count != 3 {
            setRandomValue.insert(getRandomValue())
        }
        
        // set에 저장된 랜덤 값을 배열에 추가(인덱스 자리를 위해)
        for i in setRandomValue {
            answerArray.append(i)
        }
        print(answerArray)  // - 테스트를 위한 프린트문
    }
    
}
