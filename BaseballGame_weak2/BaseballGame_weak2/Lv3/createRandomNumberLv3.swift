//
//  createRandomNumberLv3.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/5/24.
//

import Foundation

// Lv3 랜덤한 숫자 3개 생성하기(0 포함)
/*
 <조건>
 1. 중복된 값이 있으면 안됨
 2. 처음 값이 0이면 안됨
 */
func createRandomNumberLv3() -> [Int] {
    var numberArray: [Int] = []
    while numberArray.count < 3 {
        let num: Int = Int.random(in: 0...9)
        guard !numberArray.contains(num % 10) else {
            continue
        }
        numberArray.append(num)
        guard numberArray.first == 0 else { continue }
        numberArray.removeFirst()
    }
    return numberArray
}
