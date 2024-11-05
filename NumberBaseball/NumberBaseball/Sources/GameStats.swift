//
//  GameStats.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//

import Foundation

// Record game records and show them when called
class GameStats {
    var records: [[Int]] = []
    var currentGameNumber: Int = 1
    
    init() {}
    
    func record(_ pitches: Int){
        self.records.append([self.currentGameNumber, pitches])
    }
    
    func incrementGameNumber() {
        self.currentGameNumber += 1
    }
    
    func show() {
        print("""
        
        < Game Records >
        """)
        
        guard !records.isEmpty else {
            print("There's no record, dawg!!")
            sleep(2)
            return
        }
        
        for record in records {
            if record[1] == 1 {
                print("[Game \(record[0])] Nailed with only 1 Pitch - Wut da heeeeeeeeeeeeeeel")
                continue
            }
            print("[Game \(record[0])] Nailed with \(record[1]) pitches")
        }
        
        print("")
        
        while true {
            print("Press Enter to continue...", terminator:"")
            guard let _ = readLine() else { continue }
            break
        }
        
        return
    }
}
