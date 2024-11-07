//
//  HelpPrompt.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/5/24.
//

import Foundation

// Show help message
struct HelpPrompt: InterruptiblePrompt {
    
    func ask() -> Bool {
        sleep(1)
        
        // Help Loop
        while true {
            print("""
            
            < How to Play >
            Enter a 3-digit number to throw a pitch.
            The rules are as follows:
            
            < Rules >
            Numbers Only: Input must contain only numbers; letters or special characters are not allowed.
            Number Length: Enter a 3-digit number.
            Leading Digit: The first digit cannot be 0.
            No Duplicates: Each digit must be unique.
            
            < How to Reset >
            You can type 'quit' to reset while in-game.
            """)
            print("\nPress Enter to continue...", terminator:"")
            
            // Prompt: are you done seeing?
            guard let _ = readLine() else { continue }
            
            sleep(1)
            return true
        }
        
    }
}
