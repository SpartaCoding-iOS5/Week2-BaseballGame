//
//  PlayData.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/6/24.
//

import Foundation

// 유저의 플레이 정보를 저장하는 구조체
struct PlayData {
    var playCount: Int = 0
    var tryCount: Int = 0
    var history: String = ""
    
    /// playCount와 tryCount를 history에 저장하는 메소드
    mutating func savedGameRecord() {
        let record: String = "\(self.playCount)번째 게임: 시도횟수 - \(self.tryCount)"
        
        self.history = record
    }
}
