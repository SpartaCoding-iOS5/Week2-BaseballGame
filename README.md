# 숫자 야구 게임 과제 (Week 2)

- 숫자 야구 게임은 1에서 9까지의 서로 다른 3개의 숫자를 맞추는 게임입니다.
- 이 리포지토리에서는 각 레벨별 구현을 통해 게임 기능을 개선하고 확장하는 과정을 설명합니다.
---
## 📋 레벨별 기능 요약

- **[레벨 1 - 숫자 야구 게임 기본 로직](#레벨-1---숫자-야구-게임-기본-로직)**: 기본 숫자 야구 게임 로직을 구현합니다. (현재 단계)
- **[레벨 2](#레벨-2)**: 정답 입력 힌트 기능을 강화합니다.
- **[레벨 3](#레벨-3)**: 정답 입력 힌트와 제한 시간을 추가합니다.
- **[레벨 4](#레벨-4)**: 여러 라운드로 구성된 게임 모드를 추가합니다.
- **[레벨 5](#레벨-5)**: 최고 점수 기록 기능을 추가하여 랭킹을 표시합니다.
- **[레벨 6](#레벨-6)**: 사용자 인터페이스(UI)를 개선하고 다양한 게임 모드를 지원합니다.

---
## 📂 코드 파일 구조
* `main.swift`: 게임의 메인 진입점으로, 레벨을 선택하고 시작할 수 있도록 구성되어 있습니다. startGame() 함수가 게임의 시작을 담당합니다.
* `Lv_1.swift ~ Lv_6.swift`: 각 레벨별 요구사항에 맞게 구현된 파일입니다. 각 파일에는 해당 레벨의 기능을 구현하는 함수가 포함되어 있습니다.

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
            levelTwo()
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
**구현 목표**: 1에서 9까지의 서로 다른 임의의 수 3개를 정하고, 사용자가 해당 숫자를 맞추는 게임입니다. 정답은 게임 시작 시 랜덤으로 생성되며, 사용자는 정답을 맞출 때까지 계속해서 세 자리 숫자를 입력하게 됩니다. 입력값이 유효한지 검사하고,` 스트라이크`와 `볼`을 통해 힌트를 제공합니다.

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

⠀**다음 레벨 예고:** 레벨 2에서는 게임 로직을 확장하여 힌트를 강화하거나 추가 기능을 포함할 예정입니다.

추후 레벨 2~6 구현이 완료되면 각 레벨별 설명을 추가할 예정입니다.
