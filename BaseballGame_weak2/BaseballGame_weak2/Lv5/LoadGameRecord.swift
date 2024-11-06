//
//  LoadGameRecord.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/6/24.
//

import Foundation

// 게임 기록을 불러오는 메소드를 가진 프로토콜
protocol RecordLoading {
    func loadGameRecord(_ history: [String])
}

// RecordLoading 프로토콜 준수
extension BaseballGameLogic {
    /// 게임 기록을 불러오는 메소드
    /// - Parameter history: 게임 기록을 저장한 String 배열을 입력
    func loadGameRecord(_ history: [String]) {
        if !history.isEmpty {
            history.forEach { record in
                print(record)
            }
            print(MagicNumber.blank)
        } else {
            print("아직 저장된 게임 기록이 없습니다.")
            print(MagicNumber.blank)
        }
    }
}
