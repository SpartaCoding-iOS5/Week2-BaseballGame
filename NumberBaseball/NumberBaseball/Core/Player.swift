//
//  Player.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//

import Foundation

// Record game records and show them when called
class Player {
    private var records: [[Int]] // Store Game Records
    var currentGameNumber: Int
    var currentTargetNumber: Int
    var pitchCount: Int
    var didWinTheGame: Bool
    var shouldExitGameLoop: Bool

    init(
        records: [[Int]] = [],
        currentGameNumber: Int = 1,
        currentTargetNumber: Int = 0,
        pitchCount: Int = 0,
        didWinTheGame: Bool = false,
        shouldExitGameLoop: Bool = false
        ) {
        self.records = records
        self.currentGameNumber = currentGameNumber
        self.currentTargetNumber = currentTargetNumber
        self.pitchCount = pitchCount
        self.didWinTheGame = didWinTheGame
        self.shouldExitGameLoop = shouldExitGameLoop
        }
    
    // for future feature: Player Database
    convenience init(_ records: [[Int]], _ currentGameNumber: Int) {
        self.init(
            records: records,
            currentGameNumber: currentGameNumber
        )
    }
    
    // Generate a random target number
    func generateTargetNumber() {
        self.currentTargetNumber = TargetNumberGenerator().random()
    }
    
    // Return Records count
    func recordsCount() -> Int {
        return self.records.count
    }
    
    // Record game
    func record() {
        self.records.append([self.currentGameNumber, (self.didWinTheGame ? 1 : 0), self.pitchCount, self.currentTargetNumber])
        showRecord(self.currentGameNumber - 1)
    }
    
    // Show record
    func showRecord(_ index: Int) {
        let record = records[index]
        
        if record[1] == 1 { // < Wins >
            if record[2] == 1 { // Win: Hole in One
                print("[Game \(record[0])] Nailed with only \(record[2]) pitch!!! -> \(record[3])") ; return
            } // Common Win
            print("[Game \(record[0])] Nailed with \(record[2]) pitches! -> \(record[3])")
        } else if record[1] == 0 { // < Loses >
            if record[2] == 1 { // Lose: Speedrun attempt?
                print("[Game \(record[0])] Tried with \(record[2]) pitch. -> \(record[3])") ; return
            } // Common Lose
            print("[Game \(record[0])] Tried with \(record[2]) pitches... -> \(record[3])")
        }
    }
    
    // Show records
    func showRecords() {
        sleep(1) ; print("\n< Game Records >")
        
        guard !records.isEmpty else { // if records is empty, print this
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
