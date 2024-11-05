//
//  GameStats.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//


class GameStats {
    var game = 0
    var pitches = 0
    
    func record(_ game: Int, _ pitches: Int) -> [Int] {
        return [game, pitches]
    }
}
