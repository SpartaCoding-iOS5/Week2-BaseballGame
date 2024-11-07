//
//  PrintManager.swift
//  Week2-BaseballGame
//
//  Created by CHYUN on 11/7/24.
//

protocol PrintMessage {
    func printError(error: InputError)
    func printGuideance(guide: Guidance)
}

struct PrintManager: PrintMessage {
    
    func printError(error: InputError) {
        
        let message = switch error {
        case InputError.inputCountError:
            "The number of inputs is insufficient."
        case InputError.invalidInputError:
            "Invalid input."
        case InputError.zeroInputError:
            "The first position cannot contain a zero."
        case InputError.duplicateValueError:
            "There are duplicate values."
        case InputError.unknownError:
            "There are unknown errors."
        }
    
        print(message)
    }
    
    func printGuideance(guide: Guidance) {
        
        let message = switch guide {
        case Guidance.welcome :
            "Welcome! Please enter the number to execute. \n 1. Game Start 2. Record 3. Exit"
        case Guidance.gameStart :
            "*** Game Start ***"
        case Guidance.gameEnd :
            "***Game End***"
        case Guidance.requireInput :
            "Please enter the numbers for each question mark in order, then press Enter."
        case Guidance.inputAgain :
            "Input the number to execute again."
        case Guidance.noRecord :
            "No Record"
        case Guidance.strike :
            "Stike"
        case Guidance.ball :
            "Ball"
        case Guidance.hit :
            "Congratulation! HIT!!"
        case Guidance.out :
            "OUT!"
        }
        print(message)
    }

}


