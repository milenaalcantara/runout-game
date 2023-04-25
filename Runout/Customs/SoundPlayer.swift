//
//  SoundPlayer.swift
//  Runout
//

import SpriteKit

class SoundPlayer {
    
    let buttonSound = SKAction.playSoundFileNamed("button", waitForCompletion: false)
    let coinSound = SKAction.playSoundFileNamed("coin", waitForCompletion: false)
    let deathSound = SKAction.playSoundFileNamed("gameover", waitForCompletion: false)
    let completedSound = SKAction.playSoundFileNamed("completed", waitForCompletion: false)
    let powerupSound = SKAction.playSoundFileNamed("powerup", waitForCompletion: false)
    
}
