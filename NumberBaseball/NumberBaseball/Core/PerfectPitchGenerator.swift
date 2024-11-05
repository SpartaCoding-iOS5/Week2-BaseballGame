//
//  answerGenerator.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

// Generate a random answer from answersList
struct PerfectPitchGenerator {
    func random(_ pitchesList: Array<Int>) -> Int {
        if let answer = pitchesList.randomElement() {
            return answer
        } else {
            print("Error: Invalid Answers List")
            return -1
        }
    }
}
