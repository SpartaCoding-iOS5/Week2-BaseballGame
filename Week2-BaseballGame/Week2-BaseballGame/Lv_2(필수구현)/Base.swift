
class BaseBallGame {
    let answer = GetAnswer()
    let userValue = GetUserValue()
    lazy var checkAnswer = CheckAnswer(getAnswer: answer, getUserValue: userValue)
    
    // 게임시작 -> 정답 생성
    func initGame() {
        print("< 게임 시작 >")
        answer.getAnswser()
    }
    
    // 값을 입력 받기 -> User입력값 초기화, 값 입력 받기(정답이 맞을때 까지)
    func startGame() {
        // while문 do 위치 고민해보기
        while checkAnswer.strike != answer.answerArray.count {
            userValue.initUserValue()
            do { // do catch를 이용한 에러처리
                try userValue.inputUserValue()
                checkAnswer.checkAnswer()
                checkAnswer.printResult()
            } catch ErrorHandling.emptyInput {
                print("값을 입력해주세요.")
            } catch ErrorHandling.wrongInput {
                print("숫자 이외의 값을 입력하셨습니다.")
            } catch ErrorHandling.duplicateNumber {
                print("중복된 값을 입력하셨습니다.")
            } catch ErrorHandling.inputZero {
                print("숫자 0을 입력하셨습니다.")
            } catch ErrorHandling.outOfRange {
                print("3자릿수를 입력해주세요")
            } catch {
                print("알 수 없는 오류")
            }
        }
    }
}

