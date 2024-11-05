//
//  answerGenerator.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

struct AnswerGenerator {
    func random(_ answersList: Array<Int>) -> Int {
        if let answer = answersList.randomElement() {
            return answer
        } else {
            print("Error: Invalid Answers List")
            return -1
        }
    }
}
