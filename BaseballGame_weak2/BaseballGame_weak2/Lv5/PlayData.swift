//
//  PlayData.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/6/24.
//

import Foundation

struct PlayData {
    var playCount: Int = 0
    var tryCount: Int = 0
    var history: String = ""
    
    mutating func savedGameRecord() {
        let record: String = "\(self.playCount)번째 게임: 시도횟수 - \(self.tryCount)"
        
        self.history = record
    }
}
