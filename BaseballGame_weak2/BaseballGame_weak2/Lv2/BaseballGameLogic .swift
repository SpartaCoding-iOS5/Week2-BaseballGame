//
//  Baseball.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/4/24.
//

import Foundation

// 야구게임이 준수해야할 프로토콜 선언
protocol BaseballGameLogic  {
    var currentNumber: [Int]? { get set }
    var result: String { get set }
    var rightAnswer: Bool { get set }
}
