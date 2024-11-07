//
//  BaseballGameLevel6.swift
//  Week2-BaseballGame
//
//  Created by 권승용 on 11/7/24.
//

import Foundation

class BaseballGameLevel6: BaseballGameLevel5 {
    override func endGame() {
        print("< 숫자 야구 게임을 종료합니다 >")
        RecordManager.shared.reset()
    }
}
