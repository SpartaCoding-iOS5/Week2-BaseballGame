//
//  BaseballExtension.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/4/24.
//

import Foundation

// 프로토콜에서 메소드 구현하기
extension BaseballGameLogic  {
    /// 게임을 시작하는 메소드
    public mutating func play() {
        print("< 게임을 시작합니다 >")
        
        // 게임을 실행하는 메소드
        tryGame()
    }
}

