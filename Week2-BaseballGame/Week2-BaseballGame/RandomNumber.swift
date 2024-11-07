class RandomNumber {
    var randomNumber = [Int]()
    
    init() {
        randomNumber = makeRandomNumber()
    }
    
    // 서로 다른 임의수 3개를 만드는 함수
    func makeRandomNumber() -> [Int] {
        // 랜덤 숫자를 저장할 Set 생성
        var randomNumber = [Int]()

        // 서로 다른 숫자가 3개를 생성할 때까지 반복
        while (randomNumber.count < 3) {
            let thisRandomNumber = Int.random(in: 0...9)
            
            // 배열의 첫 요소이고 랜덤 숫자가 0인지 확인
            if thisRandomNumber == 0 && randomNumber.count == 0 {
                continue
            }
            
            // 중복값이 없으면 배열에 랜덤 숫자 추가
            if !randomNumber.contains(thisRandomNumber) {
                randomNumber.append(thisRandomNumber)
            }
        }
        
        // 베열로 변환 후 반환
        return randomNumber
    }
    
    // 랜덤 숫자와 입력값을 비교하는 함수
    func compareInput(_ input: [Int]) -> Result {
        // 결과를 저장한 변수 생성
        var strike = 0
        var ball = 0

        for i in randomNumber.indices {
            for j in input.indices {
                // 자리&숫자 같으면 스트라이크
                if i == j && randomNumber[i] == input[j] { strike += 1 }
                // 숫자만 같으면 볼
                else if randomNumber[i] == input[j] { ball += 1 }
            }
        }
        
        let result: Result
        
        if strike > 0 && ball > 0 {
            result = .strikeBall
        } else if strike == 3 {
            result = .success
        } else if strike > 0 {
            result = .strike
        } else if ball > 0 {
            result = .ball
        } else {
            result = .out
        }
        
        result.printResult(strike: strike, ball: ball)
        
        return result
    }
}
