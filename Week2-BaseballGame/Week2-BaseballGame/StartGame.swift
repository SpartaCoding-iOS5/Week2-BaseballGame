
// 게임 시작을 위한 클래스
class StartGame {
    let baseBallGame = BaseBallGame()
    let gameRecord = GameRecord()
    
    // 게임의 시작(반복)과 끝을 정하는 메서드
    func roof() {
        if BaseBallGame.endPoint == 0 {
            initGame()
        } 
    }
    
    // 초기 게임 시작시 화면 출력과 각 모드에 진입
    func initGame() {
        let range = 1...3
        var select = 0
        print(" 🙌🏻 환영합니다! 원하시는 번호를 입력해주세요")
      
        // 보기 선택이 이루어지도록 구현
        while !range.contains(select) {
            print("< 1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기 >")
            if let input = readLine() {
                select = Int(input) ?? 0
                switch select {
                case 1 :    // 게임 시작
                    baseBallGame.settingGame()
                    baseBallGame.startGame()
                case 2 :    // 기록 보기
                    print("< 🧾 게임 기록 보기 >")
                    gameRecord.showRecord()
                case 3 :    // 종료하기
                    print("< 👋🏻 숫자 야구 게임을 종료합니다. >")
                    // roof 메서드안의 if문에서 탈출
                    BaseBallGame.endPoint = 1
                    GameRecord.tryRecordArray.removeAll()   // 기록 초기화
                default :   // 정해진 숫자 외의 값을 입력 받았을 때
                    print(" # 보기에 있는 숫자를 입력해주세요. # ")
                    
                }
            }
        }
        roof()
    }
}
