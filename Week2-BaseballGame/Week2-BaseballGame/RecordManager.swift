//
//  RecordManager.swift
//  Week2-BaseballGame
//
//  Created by CHYUN on 11/6/24.
//

struct RecordManager {
    
    private var record: [(round: Int, tries: Int)] = []
    
    mutating func recordSet(tries: Int) {
        record.append((record.count + 1, tries))
    }
    
    func showRecord() {
        
        guard !record.isEmpty else {
            print(Guidance.noRecord)
            return
        }
        
        let recordString = record.map { round, tries in
            "\(round) Round : Try - \(tries)"
        }.joined(separator: "\n")
        
        print(recordString)
    }
}
