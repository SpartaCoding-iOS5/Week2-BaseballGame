
// 유저 값과 정답 값을 확인하는 클래스
class CheckAnswer {
    let getAnswer: GetAnswer
    let getUserValue: GetUserValue
    var strike = 0
    var ball = 0
    
    init(getAnswer: GetAnswer, getUserValue: GetUserValue) {
        self.getAnswer = getAnswer
        self.getUserValue = getUserValue
    }
    
    func checkAnswer() {
        // 유저와 정답 배열을 셋으로 다시 생성(같은 수(ball)가 몇개인지 체크하기 위해)
        let userArrayToSet:Set<Int> = Set(getUserValue.userArray)
        let answerArrayToSet:Set<Int> = Set(getAnswer.answerArray)
        
        
        // 입력한 유저 값이 정답에 몇개가 중복되는지를 체크 후 set의 갯수를 ball의 수로 지정, strike수 초기화(중복되는걸 방지)
        ball = answerArrayToSet.intersection(userArrayToSet).count
        strike = 0
        
        // 유저 입력한 값과 정답 값을 각 인덱스(자리)를 비교해서 자리가 맞으면 strike수를 올리고 이전에 정의한 ball 갯수를 차감한다.
        for i in 0..<getUserValue.userArray.count {
            if (getUserValue.userArray[i] == getAnswer.answerArray[i]) {
                strike += 1
                ball -= 1
            }
        }
    }
    
    // 결과를 출력하는 메서드
    func printResult() {
        if ball == 0 && strike == 0 {
            // ball과 strike 수가 없는 경우 아웃
            print("OUT")
        } else if strike == getAnswer.answerArray.count {
            // strike 수가 정답의 갯수와 같은 경우
            print("정답입니다.")
        } else {
            print("[ \(strike) S, \(ball) B ]")
        }
    }
    
}
