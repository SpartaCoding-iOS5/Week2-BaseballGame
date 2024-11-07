//
//  StatManager.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//

import Foundation

// Record game records and show them when called
class Player {
    var records: [[Int]]
    var currentGameNumber: Int
    var pitchCount: Int
    var didWinTheGame: Int // 0 == false, 1 == true
    var shouldExitGameLoop: Bool
    
    init(
        records: [[Int]] = [],
        currentGameNumber: Int = 1,
        pitchCount: Int = 0,
        didWinTheGame: Int = 0,
        shouldExitGameLoop: Bool = false
        ) {
        self.records = records
        self.currentGameNumber = currentGameNumber
        self.pitchCount = pitchCount
        self.didWinTheGame = didWinTheGame
        self.shouldExitGameLoop = shouldExitGameLoop
        }
    
    convenience init(_ records: [[Int]], _ currentGameNumber: Int) {
        self.init(
            records: records,
            currentGameNumber: currentGameNumber
        )
    }
    
    // Record game
    func record(_ targetNumber: Int) {
        self.records.append([self.currentGameNumber, self.didWinTheGame, self.pitchCount, targetNumber])
    }
    
    // Reset pitchCount
    func resetPitchCount() {
        self.pitchCount = 0
    }
    
    // Add up pitchCount
    func addPitchCount() {
        self.pitchCount += 1
    }
    
    // Reset didWinTheGame
    func resetDidWinTheGame() {
        self.didWinTheGame = 0
    }
    
    // Add up CurrentGameNumber
    func addCurrentGameNumber() {
        self.currentGameNumber += 1
    }
    
    // Show record
    func showRecord(_ index: Int) {
        let record = records[index]
        
        if record[1] == 1 { // < Wins >
            if record[2] == 1 { // Hole in One
                print("[Game \(record[0])] Nailed with only \(record[2]) pitch!!! - \(record[3])") ; return
            } // Common Win
            print("[Game \(record[0])] Nailed with \(record[2]) pitches! - \(record[3])")
        } else if record[1] == 0 { // < Loses >
            if record[2] == 1 { // Speedrun attempt? Lose
                print("[Game \(record[0])] Tried with \(record[2]) pitch. - \(record[3])") ; return
            } // Common Lose
            print("[Game \(record[0])] Tried with \(record[2]) pitches.. - \(record[3])")
        }
    }
    
    // Show records
    func showRecords() {
        sleep(1) ; print("\n< Game Records >")
        
        guard !records.isEmpty else { // if records is empty
            print("There's no record, dawg!!") ; sleep(1)
            return
        }
        
        for index in records.indices {
            showRecord(index)
        }

        // Prompt: are you done seeing?
        while true {
            print("\nPress Enter to continue...", terminator:"")
            guard let _ = readLine() else { continue }
            break
        }
        
        return
    }
}
