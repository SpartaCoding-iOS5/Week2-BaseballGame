//
//  Computer.swift
//  Week2-BaseballGame
//
//  Created by 권승용 on 11/7/24.
//

struct Computer: Player {
    func answer() throws -> Int {
        var answer: Int = 0
        var isDuplicated = true
        
        while isDuplicated {
            let randomNum = Int.random(in: 102...987)
            
            if Set(String(randomNum)).contains("0") {
                continue
            }
            if Set(String(randomNum)).count == 3 {
                answer = randomNum
                isDuplicated = false
            }
        }
        
        return answer
    }
}
