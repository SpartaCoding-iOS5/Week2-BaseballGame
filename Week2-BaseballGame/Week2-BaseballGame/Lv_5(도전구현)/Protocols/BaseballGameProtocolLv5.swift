// Command Line Tool Project file for BaseballGame Lv_5 - Protocols/BaseballGameProtocol
// 작성일: 2024.11.07 (목요일)
//
// 작성자: Jamong
// 이 파일은 Lv_5의 기본 기능을 정의하는 BaseballGameProtocolLv5을 포함한다.


/// 야구 게임의 기본 기능을 정의하는 프로토콜
/// 게임 시작과 입력 검증 기능일 제공
protocol BaseballGameProtocolLv5 {
    
    /// 정답을 저장하는 배열
    var answer: [Int] { get set }
    /// 스트라이크, 볼 개수를 저장하는 변수
    var strike: Int { get set }
    var ball: Int { get set }
    
    /// 게임 기록을 위한 배열 및 변수
    var gameRecords: [Int] { get set}
    var gameAttempts: Int { get set }
    
    /// 게임 가이드 메서드
    func startGame()
    
    /// 게임을 시작하는 메서드
    func startBaseballGame() -> Int
    
    /// 사용자의 입력을 검증하고 스트라이크와 볼을 계산
    /// - Parameter userInput: 사용자가 입력한 세 자리 숫자 문자열
    /// - Throws: 입력 오류가 발생할 경우 InputError를 던짐
    /// - Returns: (strike: Int, ball: Int) 형식으로 스트라이크와 볼의 개수를 반환
    func checkAnswer(userInput: String) throws -> (strike: Int, ball: Int)
    
    /// 정답과 사용자의 입력을 비교하여 스트라이크와 볼 개수를 계산합니다.
    /// - Parameter userAnswer: 사용자가 입력한 숫자 배열
    /// - Parameter answer: 정답 배열
    /// - Returns: (strike: Int, ball: Int) 형식으로 스트라이크와 볼의 개수를 반환합니다.
    func evaluateBall(userAnswer: [Int], answer: [Int]) -> (strike: Int, ball: Int)
}
