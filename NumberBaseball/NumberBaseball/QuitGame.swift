//
//  Quit.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//

import Foundation

class QuitGame {
    let messageY = """
    
    Aight, see ya next game.
    """

    let messageN = """
    
    Gotcha homie, gettin back into game.
    """
    
    func askLoop() -> Bool{
        while true {
            print("You sure you wanna quit? ( Y / N ) : ", terminator: "")
            
            guard let userInput = readLine()?.uppercased() else { continue }
            
            switch userInput {
            case "Y":
                print(self.messageY)
                sleep(1)
                return true
            case "N":
                print(self.messageN)
                sleep(1)
                return false
            default:
                print("You aight? Enter 'Y' or 'N'.")
            }
        }
    }
}
