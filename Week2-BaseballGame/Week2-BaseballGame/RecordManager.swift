//
//  RecordManager.swift
//  Week2-BaseballGame
//
//  Created by CHYUN on 11/6/24.
//

class RecordManager {
    
    private var record: [(Int, Int)] = []
    
    func recordSet(tryCount: Int) {
        record.append((record.count + 1, tryCount))
    }
    
    func showRecord() {
        
        var stringBuffer = ""
        
        if !record.isEmpty {
            for index in 0...record.count - 1 {
                let setCount = record[index].0
                let tryCount = record[index].1
                stringBuffer.append(contentsOf: "\(setCount) Round : Try - \(tryCount)\n")
            }
            
        } else {
            
            stringBuffer = GameMessage.noRecordMessage
        }
        print(stringBuffer)
    }
}
