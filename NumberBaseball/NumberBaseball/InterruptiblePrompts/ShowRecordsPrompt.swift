//
//  ShowRecordsPrompt.swift
//  NumberBaseball
//
//  Created by DoyleHWorks on 11/8/24.
//

import Foundation

// Show records
struct ShowRecordsPrompt: InterruptiblePrompt {
    
    func ask(_ player: Player) -> Bool {
        
        player.showRecords()
        
        while true {
            // Prompt: are you done seeing?
            guard let _ = readLine() else { continue }
            
            sleep(1)
            return true
        }
        
    }
}
