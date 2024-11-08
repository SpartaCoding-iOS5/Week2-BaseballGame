//
//  RecordManager.swift
//  Week2-BaseballGame
//
//  Created by 권승용 on 11/7/24.
//

class RecordManager {
    static let shared = RecordManager()
    
    private init() {}
    
    private var records: [Int] = []
    
    func record(_ time: Int) {
        records.append(time)
    }
    
    func printRecords() {
        print("< 게임 기록 보기 >")
        for index in records.indices {
            print("\(index + 1)번째 게임 : 시도 횟수 - \(records[index])\n")
        }
    }
}
