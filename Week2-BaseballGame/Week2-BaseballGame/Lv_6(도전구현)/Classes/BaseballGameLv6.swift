// Lv 6 (11/07 까지)

/*
 3번 종료하기의 경우 프로그램이 종료됩니다
 이전의 게임 기록들도 초기화됩니다
 // 예시
 환영합니다! 원하시는 번호를 입력해주세요
 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
 3 // 3번 종료하기 입력

 < 숫자 야구 게임을 종료합니다 >
 ​
 1, 2, 3 이외의 입력값에 대해서는 오류 메시지를 보여주세요
 // 예시
 환영합니다! 원하시는 번호를 입력해주세요
 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
 4

 올바른 숫자를 입력해주세요!
*/


// Command Line Tool Project file for BaseballGame Lv_6 - Classes/BaseballGame
// 작성일: 2024.11.07 (목요일)
//
// 작성자: Jamong
// 이 파일은 Lv_6의 BaseballGameLv6 클래스를 정의하고 BaseballGameProtocolLv6를 준수하여 야구 게임의 주요 로직을 포함한다.

import Foundation

/// BaseballGame 클래스는 BaseballGameProtocolLv6을 구현하여 게임의 주요 로직을 관리
/// 사용자 입력을 검증하고, 스트라이크와 볼 개수를 판정
class BaseballGameLv6: BaseballGameProtocolLv6 {
    
    /// 정답 배열, 스트라이크, 볼을 저장
    var answer: [Int]
    var strike: Int
    var ball: Int
    
    /// 게임 기록을 위한 배열 및 변수
    var gameRecords: [Int]
    var gameAttempts: Int

    /// 게임 시작 시 필요한 초기값을 설정
    init() {
        self.answer = AnswerCreatorLv6.create()     // 정답 생성 (중복되지 않는 세 자리 숫자 생성)
        self.strike = 0     // 초기 스트라이크 개수
        self.ball = 0       // 초기 볼 개수
        
        self .gameRecords = []
        self .gameAttempts = 0
    }
    
    /// 게임 가이드 메서드
    /// 1. 게임시작, 2. 게임기록, 3, 종료하기를 제공
    func startGame() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print(" 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            print("ㄴ ", terminator: "")
            
            let userInput = readLine()
            print("")
            
            guard let userIntInput = Int(userInput ?? ""), (1...3).contains(userIntInput) else {
                print("유효하지 않은 입력으로 1, 2, 3 중 하나를 선택하세요.")
                continue
            }
            switch userIntInput {
            case 1:
                gameRecords.append(startBaseballGame())
            case 2:
                displayGameRecords()
            case 3:
                exit(0)
            default:
                continue
            }
        }
    }
    
    /// 야구 게임 시작 메서드
    /// 사용자가 정답을 맞출 때까지 입력을 받고, 입력에 대한 결과(스트라이크, 볼)을 제공
    func startBaseballGame() -> Int {
        print("야구 게임 시작")
        
        gameAttempts = 0
        
        while true {
            print("\n세 자리 숫자를 입력하세요: ", terminator: "")
            
            // 사용자 입력 받기
            guard let userInput = readLine() else { continue }
            
            do {
                // 사용자의 입력에 대한 스트라이크 볼 개수를 판정
                let (strike, ball) = try checkAnswer(userInput: userInput)
                
                // 시도 횟수 증가 (오류 없을 때만)
                gameAttempts += 1
                
                // 게임 결과에 따른 메세지를 출력
                if strike == 3 {
                    print("정답입니다.\n")
                    return gameAttempts
                } else if strike == 0 && ball == 0 {
                    print("아웃")
                } else if strike != 0 && ball == 0 {
                    print("\(strike)스트라이크")
                } else if strike == 0 && ball != 0 {
                    print("\(ball)볼")
                } else {
                    print("\(strike)스트라이크 \(ball)볼")
                }
                
                
            } catch InputErrorLv6.invalidLength {
                print(InputErrorLv6.invalidLength.errorMessage)
            } catch InputErrorLv6.notNumber {
                print(InputErrorLv6.notNumber.errorMessage)
            } catch InputErrorLv6.duplicateNumbers {
                print(InputErrorLv6.duplicateNumbers.errorMessage)
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
        // 0부터 9까지의 수를 받기 때문에 맨 앞에 0을 걸러줌
        guard let userNumber = Int(userInput), (100...999).contains(userNumber) else {
            throw InputErrorLv6.invalidLength
        }
        
        var userAnswerArray: [Int] = []
        
        for char in userInput {
            guard let userAnswerChar = Int(String(char)) else {
                throw InputErrorLv6.notNumber
            }
            userAnswerArray.append(userAnswerChar)
        }
        
        guard Set(userAnswerArray).count == 3 else {
            throw InputErrorLv6.duplicateNumbers
        }
        
        return evaluateBall(userAnswer: userAnswerArray, answer: answer)
    }
    
    /// 정답과 사용자의 입력을 비교하여 스트라이크와 볼 개수를 계산
    /// - Parameters:
    ///   - userAnswer: 사용자가 입력한 숫자 배열
    ///   - answer: 정답으로 설정된 숫자 배열
    /// - Returns: (strike: Int, ball: Int) 형식으로 스트라이크와 볼의 개수를 반환
    func evaluateBall(userAnswer: [Int], answer: [Int]) -> (strike: Int, ball: Int) {
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
    
    func displayGameRecords() {
        print("< 게임 기록 보기 >")
        var gameCount: Int = 1
        
        if gameRecords.isEmpty {
            print("기록이 없습니다.")
        } else {
            for index in gameRecords {
                print("\(gameCount)번째 게임 : 시도 횟수 - \(index)")
                gameCount += 1
            }
        }
        print("")
    }
}
