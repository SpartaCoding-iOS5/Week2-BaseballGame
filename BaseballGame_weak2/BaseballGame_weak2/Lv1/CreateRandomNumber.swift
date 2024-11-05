//
//  createRandomNumber.swift
//  BaseballGame_weak2
//
//  Created by 장상경 on 11/4/24.
//

import Foundation

// Lv1 랜덤한 숫자 3개 생성하기
/*
 <조건>
 1. 중복된 값이 있으면 안됨
 2. 처음 값이 0이면 안됨
 */


/// 랜덤한 임의의 수 3개 만들기(1 ~ 9)
/// - Returns: 생성된 임의의 수 배열
func createRandomNumber() -> [Int] {
    var numberArray: [Int] = []
    while numberArray.count < 3 {
        let num: Int = Int.random(in: 1...9)
        guard !numberArray.contains(num % 10) else {
            continue
        }
        numberArray.append(num)
        guard numberArray.contains(0) else {
            continue
        }
        numberArray.removeLast()
    }
    return numberArray
}
