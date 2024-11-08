//
//  AbstratPrompt.swift
//  NumberBaseball
//
//  Created by t0000-m0112 on 11/7/24.
//

// Protocol for prompts that interrupt core loops (Main Loop, Game Loop)
protocol InterruptiblePrompt {
    func ask(_ player: Player) -> Bool
}
