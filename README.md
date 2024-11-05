# 숫자 야구 게임 과제 (Week 2)

- 숫자 야구 게임은 1에서 9까지의 서로 다른 3개의 숫자를 맞추는 게임입니다.
- 이 리포지토리에서는 각 레벨별 구현을 통해 게임 기능을 개선하고 확장하는 과정을 설명합니다.
---
## 📋 레벨별 기능 요약

- **[레벨 1 - 숫자 야구 게임 기본 로직](#레벨-1---숫자-야구-게임-기본-로직)**: 기본 숫자 야구 게임 로직을 구현합니다. (현재 단계)
- **[레벨 2 - 숫자 입력 힌트 강화](#레벨-2---숫자-입력-힌트-강화)**: 정답 입력 힌트 기능을 강화합니다.
- **[레벨 3](#레벨-3)**: 정답 입력 힌트와 제한 시간을 추가합니다.
- **[레벨 4](#레벨-4)**: 여러 라운드로 구성된 게임 모드를 추가합니다.
- **[레벨 5](#레벨-5)**: 최고 점수 기록 기능을 추가하여 랭킹을 표시합니다.
- **[레벨 6](#레벨-6)**: 사용자 인터페이스(UI)를 개선하고 다양한 게임 모드를 지원합니다.

---
## 📂 코드 파일 구조
```
Week2-BaseballGame/
├── main.swift                          # 게임 메인 진입점, 레벨 선택 및 시작
├── Lv_1(필수구현).swift                # 레벨 1 - 숫자 야구 기본 로직 구현 파일
├── Lv_2(필수구현)/
│   ├── Classes/
│   │   └── BaseballGame.swift          # Lv_2 - BaseballGame 클래스, 게임 로직 구현
│   ├── Models/
│   │   ├── AnswerCreator.swift         # Lv_2 - 정답 생성기 클래스
│   │   └── InputError.swift            # Lv_2 - 입력 오류 정의 파일
│   └── Protocols/
│       └── BaseballGameProtocol.swift  # Lv_2 - 게임 기본 기능을 정의하는 프로토콜
├── Lv_3(도전구현).swift                # 레벨 3 - 제한 시간 추가 (예정)
├── Lv_4(도전구현).swift                # 레벨 4 - 라운드 시스템 추가 (예정)
├── Lv_5(도전구현).swift                # 레벨 5 - 최고 점수 기록 기능 추가 (예정)
└── Lv_6(도전구현).swift                # 레벨 6 - UI 개선 및 다양한 모드 지원 (예정)
```
- main.swift: 게임의 메인 진입점으로, 레벨을 선택하고 시작할 수 있도록 구성되어 있습니다. startGame() 함수가 게임의 시작을 담당합니다.
- Lv_1(필수구현).swift: 기본 숫자 야구 게임 로직을 포함한 파일입니다.
- Lv_2(필수구현)/ 폴더: 레벨 2의 기능을 구현한 클래스, 모델, 프로토콜 파일로 구성되어 있으며, 정답 생성, 입력 검증, 게임 힌트 기능을 강화합니다.
- Lv_3(도전구현).swift ~ Lv_6(도전구현).swift: 이후 레벨별 기능 확장을 위한 파일이며, 현재 예정 상태입니다.

---

## 📝 구현 가이드
### **main.swift**
`Command Line Tool` 프로젝트에서는 하나의 `main.swift` 파일에서만 프로그램을 시작할 수 있습니다. 따라서 각 레벨별 기능을 별도의 파일로 구현한 후, `main.swift` 파일에서 해당 레벨의 함수를 호출하여 실행하도록 구성합니다.

```swift
import Foundation

func startGame() {
    print("레벨을 선택하세요 (1, 2, 3, 4, 5, 6):")
    
    if let input = readLine(), let level = Int(input) {
        switch level {
        case 1:
            levelOne()
        case 2:
            let game = BaseballGameLv2() // Lv_2 인스턴스 생성
            game.startGame()             // 인스턴스 메서드 호출
        case 3:
            levelThree()
        case 4:
            levelFour()
        case 5:
            levelFive()
        case 6:
            levelSix()
        default:
            print("유효하지 않은 레벨입니다. 1~6까지를 선택해주세요.")
        }
    } else {
        print("잘못된 입력입니다.")
    }
}

// 게임 시작
startGame()
```
`startGame()` 함수는 게임의 레벨을 선택하여 시작할 수 있도록 구성됩니다. 사용자가 입력한 레벨 번호에 따라 해당 레벨의 함수를 호출하여 게임을 진행합니다.

---

### 각 레벨 파일 (Lv_1.swift ~ Lv_6.swift) - 구현 파일

**레벨 1 - 숫자 야구 게임 기본 로직**<br>
<br>
**구현목표**: 1에서 9까지의 서로 다른 임의의 수 3개를 정하고, 사용자가 해당 숫자를 맞추는 게임입니다. 정답은 게임 시작 시 랜덤으로 생성되며, 사용자는 정답을 맞출 때까지 계속해서 세 자리 숫자를 입력하게 됩니다. 입력값이 유효한지 검사하고,` 스트라이크`와 `볼`을 통해 힌트를 제공합니다.


**코드 설명**<br>
- **정답 생성**: `randomAnswer()` 함수는 Set을 사용해 1에서 9 사이의 중복되지 않은 세 자리 숫자를 생성합니다. Set을 배열로 변환하여 반환합니다.<br>
- **사용자 입력 검증**: `levelOne()` 함수는 사용자가 입력한 세 자리 숫자를 받습니다. <br>
  * 입력값이 세 자리인지 확인
  * 입력값이 숫자인지 확인
  * 입력값이 중복이 없는지 확인
  * 이후 유효한 값일 경우 `checkBall()` 함수로 넘겨 정답과 비교합니다.
- **판정 및 힌트 제공**: `checkBall()` 함수는 입력된 숫자와 정답을 비교하여 자리와 숫자가 모두 일치하면 스트라이크, 자리와 숫자가 일치하지 않으면 볼을 제공합니다. 사용자가 정답을 맞추면 게임을 종료합니다.

**레벨 1 - 숫자 야구 게임 기본 로직**: 기본 숫자 야구 게임 로직을 구현합니다. (현재 단계) <br>

**Lv_1.swift 코드 예시**

```swift
import Foundation

func levelOne() {
    // 정답 생성
    let answerArray = randomAnswer()
    print("야구 게임 시작")

    while true {
        print("세 자리 숫자를 입력하세요:")
        
        // 제한사항: 세 자리 숫자 검사
        guard let input = readLine(), input.count == 3 else {
            print("제한사항: 세 자리 숫자를 입력해주세요.")
            continue
        }
        
        // 입력받은 값을 숫자 배열로 변환
        var userAnswerArray: [Int] = []
        for char in input {
            guard let userAnswerChar = Int(String(char)) else {
                print("제한사항: 아라비아 숫자로 입력해주세요.")
                continue
            }
            userAnswerArray.append(userAnswerChar)
        }
        
        // 제한사항: 중복 없는 세 자리 숫자 확인
        guard Set(userAnswerArray).count == 3 else {
            print("제한사항: 중복된 숫자가 존재합니다.")
            continue
        }
        
        // 판정 시작
        let (strike, ball) = checkBall(userData: userAnswerArray, answerData: answerArray)
        print("\(strike) 스트라이크, \(ball) 볼")
        
        // 정답 체크
        if strike == 3 {
            print("정답을 맞추셨습니다.")
            break
        }
    }
}

// 정답 생성 함수
func randomAnswer() -> [Int] {
    var answerSet: Set<Int> = []
    while answerSet.count != 3 {
        let randomNum = Int.random(in: 1...9)
        answerSet.insert(randomNum)
    }
    return Array(answerSet)
}

// 판정 함수
func checkBall(userData: [Int], answerData: [Int]) -> (Int, Int) {
    var strike = 0
    var ball = 0
    
    for checkIndex in 0...2 {
        if userData[checkIndex] == answerData[checkIndex] {
            strike += 1
        } else if answerData.contains(userData[checkIndex]) {
            ball += 1
        }
    }
    return (strike, ball)
}
```
**레벨 1 결과 예시**
* 사용자가 123을 입력했을 때: 2 스트라이크, 1 볼
* 정답을 맞추었을 때: 정답을 맞추셨습니다.

---
**레벨 2 - 숫자 입력 힌트 강화**<br>
**구현 목표**: 레벨 1의 기본 기능을 기반으로, 정답에 대한 힌트를 강화하고 입력값이 유효하지 않을 때 적절한 오류 메시지를 제공합니다. 올바른 자리와 숫자를 포함하는 경우 `스트라이크`와 `볼` 개수를 통해 힌트를 제공합니다.
### 주요 파일 및 역할
`BaseballGame.swift` **(Lv_2/Classes/)**
BaseballGameLv2 클래스는 BaseballGameProtocolLv2를 준수하여 게임의 주요 로직을 관리합니다. 이 클래스는 사용자의 입력을 받아 정답과 비교한 후, 스트라이크와 볼 개수를 계산하여 힌트를 제공합니다. 또한, 잘못된 입력값에 대한 예외 처리를 수행하여 오류 메시지를 출력합니다.
* **속성**:
  * `answer`: 정답으로 설정된 1~9 사이의 서로 다른 세 자리 숫자 배열입니다.
  * `strike`: 현재 사용자의 입력에서 스트라이크 개수를 나타냅니다.
  * `ball`: 현재 사용자의 입력에서 볼 개수를 나타냅니다.
* **메서드**:
  * `startGame()`: 게임을 시작하는 메서드로, 사용자가 정답을 맞출 때까지 입력을 받습니다. 각 입력에 대해 `checkAnswer` 메서드를 호출하여 스트라이크와 볼을 판정합니다.
  * `checkAnswer(userInput:)`: 사용자 입력을 검증하고 스트라이크와 볼 개수를 반환합니다. 입력값이 잘못된 경우 `InputErrorLv2` 열거형을 통해 오류를 발생시킵니다.
  * `evaluateBall(userAnswer:answer:)`: 사용자 입력과 정답을 비교하여 스트라이크와 볼 개수를 계산하는 메서드입니다.

```swift
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
        print(answer)
        
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
```

**예외 처리 및 오류 메시지**
* `**invalidLength**`: 입력이 세 자리가 아닌 경우 발생하며, "제한사항: 세 자리 숫자를 입력해주세요." 메시지를 출력합니다.
* `**notNumber**`: 입력에 숫자가 아닌 문자가 포함된 경우 발생하며, "제한사항: 아라비아 숫자만 입력해주세요." 메시지를 출력합니다.
* `**duplicateNumbers**`: 입력에 중복된 숫자가 포함된 경우 발생하며, "제한사항: 서로 다른 숫자를 입력해주세요." 메시지를 출력합니다.

⠀
`**AnswerCreator.swift**` **(Lv_2/Models/)**
`AnswerCreatorLv2` 클래스는 정답을 생성하는 역할을 담당합니다. 1부터 9까지의 서로 다른 세 자리 숫자를 랜덤하게 생성하여 배열로 반환합니다.
```swift
import Foundation

///  야구 게임에 필요한 세 자리 정답을 생성하는 클래스
///  정답은 1부터 9까지의 중복되지 않은 세 개의 숫자로 구성
class AnswerCreatorLv2 {
    
    /// - Returns: 1부터 9까지의 중복되지 않은 서로 다른 정수 3개로 구성된 배열
    static func create() -> [Int] {
        var answerSet: Set<Int> = []
        while answerSet.count < 3 {
            let randomNum = Int.random(in: 1...9)
            answerSet.insert(randomNum)
        }
        return Array(answerSet)
    }
}

```
* **역할**: 이 클래스는 정답을 생성하는 데만 집중하여 `BaseballGameLv2` 클래스가 게임 로직에만 집중할 수 있도록 분리되었습니다.

⠀
`**InputError.swift**` **(Lv_2/Models/)**
`InputErrorLv2` 열거형은 사용자의 입력에 대한 오류를 정의하여 잘못된 입력을 처리합니다.
```swift
import Foundation

/// 입력 오류를 처리하기 위한 열거형
/// 잘못된 길이, 숫자가 아닌 문장, 중복된 숫자에 대한 오류를 정의한다.
enum InputErrorLv2: Error {
    case invalidLength      // 입력이 세 자리 숫자가 아닌 경우
    case notNumber          // 입력에 숫자가 아닌 문자가 포함된 경우
    case duplicateNumbers   // 입력에 중복된 숫자가 있는 경우
}
```
* **역할**: 사용자 입력이 유효하지 않을 때 발생할 수 있는 오류의 종류를 정의하며, 각 오류는 `BaseballGameLv2`에서 예외로 처리됩니다.

⠀
`**BaseballGameProtocol.swift**` **(Lv_2/Protocols/)**
`BaseballGameProtocolLv2`는 레벨 2에서 요구되는 기본 게임 기능을 정의합니다. 이 프로토콜을 준수하는 클래스는 게임 시작, 입력 검증, 힌트 제공을 위한 메서드를 구현해야 합니다.
```swift
/// 야구 게임의 기본 기능을 정의하는 프로토콜
/// 게임 시작과 입력 검증 기능일 제공
protocol BaseballGameProtocolLv2 {
    /// 정답을 저장하는 배열
    var answer: [Int] { get set }
    /// 스트라이크, 볼 개수를 저장하는 변수
    var strike: Int { get set }
    var ball: Int { get set }
    
    /// 게임을 시작하는 메서드
    func startGame()
    
    /// 사용자의 입력을 검증하고 스트라이크와 볼을 계산
    /// - Parameter userInput: 사용자가 입력한 세 자리 숫자 문자열
    /// - Throws: 입력 오류가 발생할 경우 InputError를 던짐
    /// - Returns: (strike: Int, ball: Int) 형식으로 스트라이크와 볼의 개수를 반환
    func checkAnswer(userInput: String) throws -> (strike: Int, ball: Int)
    
    /// 정답과 사용자의 입력을 비교하여 스트라이크와 볼 개수를 계산합니다.
    /// - Parameter userAnswer: 사용자가 입력한 숫자 배열
    /// - Parameter answer: 정답 배열
    /// - Returns: (strike: Int, ball: Int) 형식으로 스트라이크와 볼의 개수를 반환합니다.
    func evaluateBall(userAnswer: [Int], answer: [Int]) -> (strike: Int, ball: Int)
}

```
* **역할**: 게임의 기본 인터페이스를 정의하여, `BaseballGameLv2`가 이 인터페이스를 준수하도록 하여 일관된 구조를 유지합니다.

⠀
### 실행 예시<br>
**1** **올바른 입력**: 정답이 `[4, 5, 6]`일 때<br>
    * 입력: `435` → 출력: `1스트라이크 1볼`<br>
    * 입력: `357` → 출력: `1스트라이크`<br>
    * 입력: `678` → 출력: `1볼`<br>
    * 입력: `123` → 출력: `아웃`<br>
**2** **잘못된 입력**<br>
    * 입력: `45` → 출력: `제한사항: 세 자리 숫자를 입력해주세요.`<br>
    * 입력: `45a` → 출력: `제한사항: 아라비아 숫자만 입력해주세요.`<br>
    * 입력: `455` → 출력: `제한사항: 서로 다른 숫자를 입력해주세요.`<br>
