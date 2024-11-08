//
//  TargetNumberGenerator.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

// Choose a random number from ValidPitches
struct TargetNumberGenerator {
    func random() -> Int {
        if let targetNumber = ValidTargetNumbers().array.randomElement() {
            return targetNumber
        } else {
            print("Error: Invalid ValidTargetNumbers List")
            return -1
        }
    }
}
