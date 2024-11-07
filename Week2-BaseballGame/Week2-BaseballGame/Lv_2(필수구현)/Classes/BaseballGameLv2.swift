// Lv 2 (11/06 까지)

/*
- 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다
    - 힌트는 야구용어인 **볼**과 **스트라이크**입니다.
    - 같은 자리에 같은 숫자가 있는 경우 **스트라이크**, 다른 자리에 숫자가 있는 경우 **볼**입니다
    - ex) 정답 : 456 인 경우
        - 435를 입력한 경우 → 1스트라이크 1볼
        - 357를 입력한 경우 → 1스트라이크
        - 678를 입력한 경우 → 1볼
        - 123를 입력한 경우 → Nothing
    - 만약 올바르지 않은 입력값에 대해서는 오류 문구를 보여주세요
- 3자리 숫자가 정답과 같은 경우 게임이 종료됩니다
- 실행 예시(정답 : 456)13123213
*/

// Command Line Tool Project file for BaseballGame Lv_2 - Classes/BaseballGame
// 작성일: 2024.11.05 (화요일)
//
// 작성자: Jamong
// 이 파일은 Lv_2의 BaseballGameLv2 클래스를 정의하고 BaseballGameProtocolLv2를 준수하여 야구 게임의 주요 로직을 포함한다.

import Foundation

/// BaseballGame 클래스는 BaseballGameProtocolLv2을 구현하여 게임의 주요 로직을 관리
/// 사용자 입력을 검증하고, 스트라이크와 볼 개수를 판정
class BaseballGameLv2: BaseballGameProtocolLv2 {
    
    /// 정답 배열, 스트라이크, 볼을 저장
    var answer: [Int]
    var strike: Int
    var ball: Int
    
    /// 게임 시작 시 필요한 초기값을 설정
    init() {
        self.answer = AnswerCreatorLv2.create()     // 정답 생성 (중복되지 않는 세 자리 숫자 생성)
        self.strike = 0     // 초기 스트라이크 개수
        self.ball = 0       // 초기 볼 개수
    }
    
    /// 야구 게임 시작 메서드
    /// 사용자가 정답을 맞출 때까지 입력을 받고, 입력에 대한 결과(스트라이크, 볼)을 제공
    func startGame() {
        print("야구 게임 시작")
        
        while true {
            print("세 자리 숫자를 입력하세요:")
            
            // 사용자 입력 받기
            guard let userInput = readLine() else { continue }
            
            do {
                // 사용자의 입력에 대한 스트라이크 볼 개수를 판정
                let (strike, ball) = try checkAnswer(userInput: userInput)
                
                // 게임 결과에 따른 메세지를 출력
                if strike == 3 {
                    print("정답입니다.")
                    break
                } else if strike == 0 && ball == 0 {
                    print("아웃")
                } else if strike != 0 && ball == 0 {
                    print("\(strike)스트라이크")
                } else if strike == 0 && ball != 0 {
                    print("\(ball)볼")
                } else {
                    print("\(strike)스트라이크 \(ball)볼")
                }
                
                
            } catch InputErrorLv2.invalidLength {
                print("제한사항: 세 자리 숫자를 입력해주세요.")
            } catch InputErrorLv2.notNumber {
                print("제한사항: 아라비아 숫자만 입력해주세요.")
            } catch InputErrorLv2.duplicateNumbers {
                print("제한사항: 서로 다른 숫자를 입력해주세요.")
            } catch {
                print("알 수 없는 오류가 발생했습니다.")
            }
        }
    }
    
    /// 사용자 입력을 검증하고 스트라이크와 볼 개수를 계산
    /// - Parameter userInput: 사용자가 입력한 세 자리 숫자 문자열
    /// - Throws: 입력 오류가 발생할 경우 InputErrorLv2를 던짐
    /// - Returns: (strike: Int, ball: Int) 형식으로 스트라이크와 볼의 개수를 반환
    func checkAnswer(userInput: String) throws -> (strike: Int, ball: Int) {
        guard userInput.count == 3 else {
            throw InputErrorLv2.invalidLength
        }
        
        var userAnswerArray: [Int] = []
        
        for char in userInput {
            guard let userAnswerChar = Int(String(char)) else {
                throw InputErrorLv2.notNumber
            }
            userAnswerArray.append(userAnswerChar)
        }
        
        guard Set(userAnswerArray).count == 3 else {
            throw InputErrorLv2.duplicateNumbers
        }
        
        return evaluateBall(userAnswer: userAnswerArray, answer: answer)
    }
    
    /// 정답과 사용자의 입력을 비교하여 스트라이크와 볼 개수를 계산
    /// - Parameters:
    ///   - userAnswer: 사용자가 입력한 숫자 배열
    ///   - answer: 정답으로 설정된 숫자 배열
    /// - Returns: (strike: Int, ball: Int) 형식으로 스트라이크와 볼의 개수를 반환
    func evaluateBall(userAnswer: [Int], answer: [Int]) -> (strike: Int, ball: Int) {
        // 변수 초기화
        strike = 0
        ball = 0
        
        for index in userAnswer.indices {
            if userAnswer[index] == answer[index] {
                strike += 1
            } else if answer.contains(userAnswer[index]) {
                ball += 1
            }
        }
        
        return (strike, ball)
    }
}
