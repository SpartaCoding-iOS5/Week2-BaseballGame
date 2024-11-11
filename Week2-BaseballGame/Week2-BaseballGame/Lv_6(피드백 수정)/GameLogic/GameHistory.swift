import Foundation

class GameHistory {
    private var records: [Int] = []
    
    func addRecord(_ attempts: Int) {
        records.append(attempts)
    }
    
    func displayRecords() {
        if records.isEmpty {
            print("기록이 없습니다.")
        } else {
            for (index, attempts) in records.enumerated() {
                print("\(index + 1)번째 게임: 시도 횟수 - \(attempts)")
            }
        }
    }
}
