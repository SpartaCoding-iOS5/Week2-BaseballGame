
// 유저 입력값 받기 위한 클래스
class GetUserValue {
    // 유저 입력 값 배열 생성 (입력 받은 값을 배열에 넣기 위해 생성)
    var userArray: [Int] = []
    
    // 입력 문구 출력과 입력 값 초기화 메서드
    func initUserValue() {
        print("숫자를 입력해주세요")
        userArray.removeAll()
    
    }
    // 깂 입력 받는 메서드
    func inputUserValue() throws {
        // guard문을 이용해 에러처리
        guard let input = readLine(), !input.isEmpty else {
            throw ErrorHandling.emptyInput
        }
        guard (Int(input) != nil) else {
            throw ErrorHandling.wrongInput
        }
        guard !input.contains("0") else {
            throw ErrorHandling.inputZero
        }
        guard let intValue = Int(input), (100...999).contains(intValue) else {
            throw ErrorHandling.outOfRange
        }
        guard Set(input).count == 3 else {
            throw ErrorHandling.duplicateNumber
        }
        let result = input.map { Int(String($0))! }
        userArray.append(contentsOf: result)
    
        print(userArray)
    }
}
