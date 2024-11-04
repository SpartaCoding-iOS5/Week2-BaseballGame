# 숫자 야구 게임 과제 (Week 2)
숫자 야구 게임은 1에서 9까지의 서로 다른 3개의 숫자를 맞추는 게임입니다. <br>
각 레벨마다 기능이 확장되며, 팀원들이 협업하여 매주 주어진 과제를 해결해 나갑니다.

# 📝 협업 규칙
### 레포지토리 설정 및 브랜치 관리
**1** **Fork로 가져오기**: 각 팀원은 레포지토리를 Fork하여 자신의 개인 레포지토리로 가져옵니다.<br>
**2** **브랜치 생성**: Fork한 개인 레포지토리에서 각자의 이름을 딴 브랜치를 생성합니다.<br>
**3** **Pull Request**: 과제를 마친 후, 각자의 브랜치로 Pull Request를 생성하여 코드 리뷰를 요청합니다. 모든 팀원이 Pull Request에 코멘트를 달고 피드백을 제공합니다. <br>
**4** **수정 및 Merge**: 피드백을 반영하여 수정하고, 팀원들의 동의를 얻은 후 merge를 진행합니다. <br>

이 과정을 통해 서로의 코드에 대해 이해를 높이고, “왜 이렇게 작성했는지”에 대한 질문과 답변을 주고받으며 과제를 진행합니다.
# 📂 코드 파일 구조
* main.swift: 게임의 메인 진입점으로, 레벨을 선택하고 시작할 수 있도록 구성되어 있습니다. startGame() 함수가 게임의 시작을 담당합니다.
* Lv_1.swift ~ Lv_6.swift: 각 레벨별 요구사항에 맞게 구현된 파일입니다. 각 파일에는 해당 레벨의 기능을 구현하는 함수가 포함되어 있습니다.

⠀📜 구현 가이드

### main.swift
Command Line Tool 프로젝트에서는 하나의 `main.swift` 파일에서만 프로그램을 시작할 수 있습니다. 따라서 각 레벨별 기능을 별도의 파일로 구현한 후, `main.swift` 파일에서 해당 레벨의 함수를 호출하여 실행하도록 구성합니다.

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
* startGame() 함수에서 게임의 레벨을 선택하여 시작할 수 있도록 구성합니다.
* 사용자가 입력한 레벨 번호에 따라 해당 레벨의 함수를 호출하여 게임을 진행합니다.


### 각 레벨 파일 (Lv_1.swift ~ Lv_6.swift) - 구현 파일

**Lv_1.swift**

```swift
import Foundation

func levelOne() {
    // 1. 정답을 생성하는 로직을 추가합니다.
    // 2. 유저가 정답을 맞출 때까지 반복해서 입력을 받습니다.
    // 3. 입력값이 유효한지 검사하고 힌트를 제공하는 기능을 구현합니다.
}
```

각 레벨별로 구현하시면 됩니다.
