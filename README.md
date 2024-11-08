# 숫자 야구 게임 과제 (Week 2)
***

## 🏃 레벨별 구현과제
- **Lv1**
    - 랜덤한 임의의 수(1~9)를 3개 생성하는 함수 만들기(currentNumber)
    - 생성된 3개의 수를 저장하는 배열 만들기
- **Lv2**
    - 사용자의 입력을 받는 로직 만들기(readLine)
    - currentNumber와 사용자의 입력(answer) 비교하는 함수 만들기
    - 숫자를 비교해서 값과 인덱스가 같다면 스트라이크, 값만 같다면 볼 출력하기
    - 3스트라이크(정답과 입력이 동일)가 된 경우 게임 종료하기
- **Lv3**
    - 랜덤한 임의의 수의 범위를 0~9로 바꾸기
    - 단, 0이 가장 앞에 있어서는 안된다(ex. 012 -> 불가능)
- **Lv4**
    - 프로그램을 시작할 때 안내문구 보여주기
    - 1번 선택시 숫자 야구 게임 시작
    - 2번 선택시 게임 기록 보기(추후 구현)
    - 3번 선택시 게임 종료 및 초기화(추후 구현)
    - ex
    ```swift
    환영합니다! 원하시는 번호를 입력해주세요
    1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
    ```
- **Lv5**
    - 게임 기록 보기를 통해 시도 횟수 보여주기
- **Lv6**
    - 종료하기를 통해 게임 종료하기
    - 종료하기를 통해 기록 초기화하기
***

## ⏰ 과제 일정
- **시작**: 24/11/4 월요일 11시
- **종료**: 24/11/8 금요일 12시까지

***

## 🔥 구현 목표
1. class, struct 중 하나를 선택하여 숫자 야구 게임을 만들고 인스턴스화 하여 사용하기
2. protocol을 사용하여 숫자 야구 게임의 로직을 구현하기
3. protocol의 수평적 기능 구현을 통해 메소드 구현하기
4. Error 타입을 정의하고 do-catch 해보기
5. 주석을 적극적으로 활용하여 코드에 대한 설명 추가하기
6. 레벨, 구현기능에 따라 디렉토리 및 파일 효율적으로 나누기
7. 이유있는 코드 작성하기!
***

## ⚒️ 기능 설명
- `.compareNumber`: [Int]와 Int타입을 파라미터로 입력받고 두 값을 비교하여 [Int]로 반환
- `.play`: 숫자 야구 게임을 실행하는 메소드
- ~`.tryGame`: 사용자의 입력을 받고 숫자 야구 게임이 종료될 때까지 반복해서 실행하는 메소드(에러 캐치)~ (삭제)
- `.gameSelect`: 게임을 시작하거나 기록을 불러오기, 게임 종료하기를 선택할 수 있는 메소드
- `savedGameRecord`: 저장된 게임 기록을 불러오는 메소드
- `exitGame`: 게임의 종료 여부를 선택할 수 있는 메소드

***

## 🤔 레벨별 고민했던 점
### Lv1
랜덤한 임의의 수를 3개 만들면서 중복은 없어야 하고, 0도 없어야 하며, 처음 값이 0이어서도 안되도록 조건을 주기 위해 어떤 코드를 사용할 수 있을지 고민을 해봤다. 중복을 피하기 위해 `Set`을 사용할까 싶었지만, 멤버의 인덱스 값이 계속해서 변하는 점이 마음에 안들어 배열로 제작을 진행했다.
- **조건 1. 랜덤한 값 3개 생성하기**
    Int타입의 값을 저장하는 배열을 생성하고, `while` 반복문으로 배열의 멤버 수가 3보다 작다면 랜덤한 수를 append 해주도록 구현
    ```swift
    var numberArray: [Int] = []
    while numberArray.count < 3 {
        let num: Int = Int.random(in: 1...9)
        numberArray.append(num)
    }
    ```
- **조건 2. 중복값 제거하기**
    중복값을 제거하기 위해 `guard` 조건문으로 배열에 값이 있는지 확인하도록 구현
    ```swift
    guard !numberArray.contains(num) else {
        continue
    }
    ```
- **조건 3. 0 제거하기**
    범위 연산자를 1~9로 설정했기 때문에 0이 들어올 일은 없지만, 만일의 경우를 대비하여 `guard` 반복문으로 0을 제거하도록 구현
    ```swift
    guard numberArray.contains(0) else {
        continue
    }
    numberArray.removeLast()
    ```

### Lv2
숫자 야구 게임을 인스턴스로 만들고 싶다고 생각하여 시작은 `struct`를 이용한 구조체로 만들었다. 또, 프로토콜을 만들어 구조체가 프로토콜을 준수하게 만들었고, 프로토콜 확장을 통해 게임을 플레이하는 메소드를 구현하고자 하였다.

결과적으로 이 방법은 일부만 성공하고 일부는 실패했는데, 프로토콜의 확장으로 게임 실행 메소드를 구현하니 

`Thread 1: Simultaneous accesses to 0x100008058, but modification requires exclusive access`

라는 오류가 발생하여 크래시가 계속해서 발생했고, 클로저 캡처로 에러를 해결했으나 정답을 맞춰도 게임이 종료되지 않는 버그 등 다양한 문제와 직면하여 결국 다른 방법을 선택하게 됐다.

`struct`로 구현했던 숫자 야구게임을 `class`로 바꾸고, 싱글톤 패턴을 이용하여 프로토콜의 확장에서 메소드를 구현하는데 성공했다. 그러나 이 방법은 프로토콜을 사용한 의미가 없고 싱글톤 패턴에 의한 의존성이 높아지는 탓에 추후 수정하였다.

### Lv3
기존에 있던 랜덤한 임의의 수를 생성하는 함수의 범위를 0~9로 늘려야 하는데, 너무 단순하다고 생각하여 함수를 만들고 Error타입을 생성하여 do-catch로 에러를 검출하고자 하였다.

`enum: Error`를 통해 에러타입을 선언하고 `thorows`를 통해 기존 메소드에 에러타입을 검출할 수 있게 만든 것은 좋았으나 이 탓에 코드를 전반적으로 수정해야 했다. 메소드에서 에러가 검출될 수 있기 때문에 `try`를 통해 메소드를 실행해야 했고, 검출된 에러를 처리하기 위해 `do-catch`도 사용해야 했기 때문이다.

결국 에러를 검출하고 에러 타입에 대한 오류 문구를 출력하는 메소드를 추가로 구현하여 구현을 마무리할 수 있었다.

### Lv4
사용자에게 선택지를 주기 위해 `gameSelect`라는 메소드를 생성하고 `readLine`을 통해 값을 입력받기로 하였다. 이 때, `switch`문을 통해 1~3의 값일 때는 각각 반환 값을 구현하고, 그 외의 deault 값은 모두 오류 문구를 반환하도록 구현하였다.

고민했던 것은 선택지를 주는 메소드를 클래스 메소드로 할 것인지, 프로토콜에서 구현할 것인지 였는데, 게임을 실행하는 메소드도 프로토콜에서 구현했기 때문에 이번에도 프로토콜에서 구현하기로 하였다. 숫자 야구 게임을 진행할 때와 마찬가지로 `while` 반복문을 사용하여 올바른 입력값을 입력할 때까지 계속해서 입력을 받도록 구현하였고, 1을 입력할 경우 프로토콜에서 구현한 숫자 야구 게임을 실행하는 메소드를 호출하도록 설정하여 마무리 하였다.

### Lv5
레벨 5의 구현은 시작부터 막막했다. 게임의 실행 자체를 프로토콜의 메소드로 구현해둔 탓에 코드가 굉장히 꼬여있었기 때문이다. 새삼스레 로직을 잘 짜고 구조를 잘 짜두어야 하는 이유를 체감하였다.

일단 게임의 실행 횟수(playCount)와 정답을 맞추기 위해 숫자를 입력한 횟수(tryCount), 그리고 이 데이터를 저장하는 구조체 `PlayData`를 생성했다. 

다음으로는 기존의 코드를 전체적으로 점검하고 불필요한 코드를 삭제하거나 수정했다.
- 🚨변경 전
    ```swift
    @main
    baseballGame.gameSelect()
    // ... //
    
    // 게임 시작, 기록 불러오기, 종료의 선택을 하는 메소드
    mutating func gameSelect() {
        // 생략..
        play()
    }
    // ... //
    
    // 게임을 실행하는 메소드를 실행하는 메소드
    mutating func play() {
        // 생략...
        tryGame()
    }
    // ... //
    
    // 게임을 실행하는 메소드
    mutating func tryGame() {
        // 게임 실행
    }
    ```
- ♻️변경 후
    ```swift
    @main
    baseballGame.gameSelect()
    // ... //
    
    // 게임 시작, 기록 불러오기, 종료의 선택을 하는 메소드
    mutating func gameSelect() {
        // 생략...
        play()
    }
    // ... //
    
    // 게임을 실행하는 메소드
    mutating func play() {
        // 게임 실행
    }
    ```
변경 전 코드를 보면 `play`메소드 내에 `tryGame`이라는 메소드를 사용하는데, 굳이 `tryGame` 메소드를 쓰지 않아도 `play` 메소드 내에서 실행하면 문제가 없는 코드였기 때문에 `tryGame` 메소드를 과감히 삭제했다. 그리고 while 반복문의 반복 조건을 수정하는 등 전체적으로 코드를 수정했다.

코드를 수정한 뒤에도 기록을 어떻게 저장하고 불러올지 고민이었는데, `BaseballGame` 클래스 내부에 게임 데이터를 저장하는 새로운 프로퍼티를 `PlayData` 타입으로 만들고, 클래스의 메소드 내에서 tryCount를 연산하도록 했다. 그 뒤, `play` 메소드의 반환값을 String으로 설정하고 playCount를 연산하게 하였다. play 메소드가 실행되면 playCount가 상승하고, 게임이 끝났을 때 playCount와 tryCount를 String 형태로 저장한다.

이렇게 하면 `gameSelect` 메소드에서 1번(게임 실행)을 선택하면 게임이 실행되고, 게임이 끝나면 메소드 내에 선언한 String 배열에 `play` 메소드의 반환값을 넣도록 했다.

그리고 2번을 선택했을 때 게임의 기록을 불러올 수 있도록 String 배열의 멤버를 인덱스 순으로 보여주는 메소드 `loadGameRecord`를 만들어 사용했다. 이렇게 무사히 기록을 불러오는 기능을 수행할 수 있게 되었다.

Q. 메소드 내에 호출한 메소드, 만약 메소드1 내에서 메소드2를 호출했을 때 메소드2에서 메소드1에 있는 변수나 상수를 사용하거나, 값을 전달할 수 있는 방법이 있을까?

### Lv6
레벨 6은 비교적 간단했는데, 게임의 종료기능을 수행하는 함수 `exitGame`을 만들고 `gameSelect` 메소드가 실행되었을 때 3번(게임 종료)를 선택하면 반복문의 조건을 false 하며 코드가 종료되도록 하였다.

레벨 6까지 마치고 보았을 때 `BaseballLogic` 프로토콜이 하는 일이 너무 많다고 생각했다. 가지고 있는 메소드만 게임 실행, 게임 선택, 기록 불러오기, 게임 종료로 4가지나 됐다. 하나의 프로토콜이 너무 많은 역할을 하는 것은 의존성이 커진다고 생각하여 역할을 분담하기로 했다.

`RecordLoading`프로토콜을 새로 만들어 게임 기록을 불러오는 메소드를 넣고, `ExitGame` 프로토콜을 만들어 게임 종료를 구현하도록 했다. 두 프로토콜을 `BaseballGameLogic` 프로토콜에 채택하여 기능을 사용할 수 있게 함으로 프로토콜의 의존성을 낮추었다.

***

## 📚과제 소감
이번에는 하고싶은 것은 많았던 반면에 준비(코드 구조 설계, 계획 등)가 부족한 채 무작정 시작하는 바람에 코드도 꼬이고 여러 문제와 마주했던 것 같다. 이번 과제를 통해 코드의 로직이 얼마나 중요한지, 왜 중요한지를 깨닫게 되었다. 앞으로는 코드를 구현하기 전에 로직과 구성, 구현 방법 등을 먼저 고민해보고 설계를 튼튼히 한 후 코드 작성을 시작해야겠다고 생각했다.
