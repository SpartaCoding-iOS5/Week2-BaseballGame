//
//  main.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//

import Foundation

// Declare answers list and valid answers
let answersList = Answers().array
let validAnswers = Set(answersList)

// Generate an answer
let answer = AnswerGenerator().random(answersList)

print("""
answersList:
\(answersList)

validAnswers:
\(validAnswers)

answer:
\(answer)
""")
