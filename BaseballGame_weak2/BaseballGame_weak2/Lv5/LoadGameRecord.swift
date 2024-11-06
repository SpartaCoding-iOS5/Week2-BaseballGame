//
//  LoadGameRecord.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/6/24.
//

import Foundation

protocol RecordLoading {
    func loadGameRecord(_ history: [String])
}

extension BaseballGameLogic {
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
