// 결과값의 열겨형
enum Result {
    case success
    case strikeBall
    case strike
    case ball
    case out
    
    func printResult(strike: Int, ball: Int) {
        switch self {
        case .success :
            print("정답입니다!\n")
        case .strikeBall:
            print("\(strike)스트라이크 \(ball)볼\n")
        case .strike:
            print("\(strike)스트라이크\n")
        case .ball:
            print("\(ball)볼\n")
        case .out:
            print("Out\n")
        }
    }
}
