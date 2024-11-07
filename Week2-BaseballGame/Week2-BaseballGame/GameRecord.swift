
// 게임 기록을 위한 클래스
class GameRecord {
    static var gameCount = 0
    static var tryCount = 0
    static var tryRecordArray:[Int] = []
    
    // 기록한 값을 출력
    func showRecord () {
        for i in 0..<GameRecord.gameCount {
            print("\(i + 1)번째 게임 : 시도 횟수 - \(GameRecord.tryRecordArray[i])")
        }
    }
    
}
