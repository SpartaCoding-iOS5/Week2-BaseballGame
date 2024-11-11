import Foundation

protocol BaseballGameProtocolLv7 {
    var answer: [Int] { get set }
    var strike: Int { get set }
    var ball: Int { get set }
    var gameRecords: [Int] { get set }
    var gameAttempts: Int { get set }
    
    func startGame()
    func startBaseballGame() -> Int
    func checkAnswer(userInput: String) throws -> (strike: Int, ball: Int)
    func evaluateBall(userAnswer: [Int], answer: [Int]) -> (strike: Int, ball: Int)
}
