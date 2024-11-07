class InputError {
    
    func checkInputErrorMain(_ input: String?) -> Bool {
        guard input!.count == 1, let inputInt = Int(input!) else {
            return true
        }
        
        return false
    }
    
    // 입력값이 올바른지 확인하는 메서드
    func checkInputErrorGame(_ input: String?) -> Bool {
        // 입력값의 길이가 3이 아니거나, 다른 타입이 있는 경우
        guard input!.count == 3, let inputInt = Int(input!), Set(input!).count == 3 else {
            return true
        }
        // 첫 번째 자리에 0이 있는 경우
        if Array(input!)[0] == "0" {
            return true
        }
        
        return false
    }
}
