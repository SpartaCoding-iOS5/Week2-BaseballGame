//
//  StatManager.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//

import Foundation

// Record game records and show them when called
class Player {
    var records: [[Int]] = []
    var currentGameNumber: Int = 1
    var pitchCount = 1
    var shouldExitGameLoop = false
    
    init() {}
    
    // Record game and Increment the game number
    func record() {
        self.records.append([self.currentGameNumber, self.pitchCount])
        self.currentGameNumber += 1
    }
    
    // Reset pitchCount
    func resetPitchCount() {
        self.pitchCount = 1
    }
    
    // add up pitchCount
    func addPitchCount() {
        self.pitchCount += 1
    }
    
    // Show records
    func showRecords() {
        sleep(1) ; print("\n< Game Records >")
        
        guard !records.isEmpty else {
            print("There's no record, dawg!!") ; sleep(1)
            return
        }
        
        for record in records {
            if record[1] == 1 {
                print("[Game \(record[0])] Nailed with only 1 pitch - Wut da heeeeeeeeeeeeeeel")
                continue
            }
            print("[Game \(record[0])] Nailed with \(record[1]) pitches")
        }

        // Prompt: continue?
        while true {
            print("\nPress Enter to continue...", terminator:"")
            guard let _ = readLine() else { continue }
            break
        }
        
        return
    }
}
