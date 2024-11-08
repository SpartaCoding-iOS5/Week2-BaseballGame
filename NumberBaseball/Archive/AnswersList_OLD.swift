//
//  answersList_OLD.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/4/24.
//


/*
import Foundation

class AnswersList {
 /*
    func load() -> String? {
        if let filePath = Bundle.main.path(forResource: "answersList", ofType: "csv") {
            do {
                // 파일 내용을 문자열로 읽기
                let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
                return fileContents
            } catch {
                print("Error occurred while reading the file: \(error)")
            }
        } else {
            print("File not found in the bundle.")
        }
        return nil
    }

    func read() -> [String] {
        if let fileContentsUnwrapped = self.load() {
            let answersList = fileContentsUnwrapped.components(separatedBy: "\n").filter { !$0.isEmpty }
            return answersList
        } else {
            print("Error occurred while unwrapping the file")
            return []
        }
    }
*/
/*
    func load() -> String? {
        let filePath = "./Resources/answersList.csv"
        do {
            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
            return fileContents
        } catch {
            print("Current Directory: \(FileManager.default.currentDirectoryPath)")
            print("Error occurred while reading the file: \(error)")
        }
        return nil
    }

    func read() -> [String] {
        if let fileContentsUnwrapped = self.load() {
            let answersList = fileContentsUnwrapped.components(separatedBy: "\n").filter { !$0.isEmpty }
            return answersList
        } else {
            print("Error occurred while unwrapping the file")
            return []
        }
    }
*/
}
*/
