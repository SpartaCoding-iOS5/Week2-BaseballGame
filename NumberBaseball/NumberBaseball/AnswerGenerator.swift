//
//  answerGenerator.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

class AnswerGenerator {
    func random(_ answersList: Array<String>) -> String {
        if let answer = answersList.randomElement() {
            return answer
        } else {
            print("Error: Invalid Answers List")
            return ""
        }
    }
}
