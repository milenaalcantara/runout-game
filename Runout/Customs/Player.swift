//
//  Player.swift
//  Runout
//

import SpriteKit

enum PlayerState {
    case idle, running
}

class Player: SKSpriteNode {

    var runFrames = [SKTexture]()
    var idleFrames = [SKTexture]()
    var jumpFrames = [SKTexture]()
    var dieFrames = [SKTexture]()
    
    var state = PlayerState.idle {
        willSet {
            animate(for: newValue)
        }
    }
    
    var airborne = false
    var invincible = false
    
    func loadTextures() {
        idleFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: GameConstants.StringConstants.playerIdleAtlas), withName: GameConstants.StringConstants.idlePrefixKey)
        runFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: GameConstants.StringConstants.playerRunAtlas), withName: GameConstants.StringConstants.runPrefixKey)
        
        jumpFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: GameConstants.StringConstants.playerJumpAtlas), withName: GameConstants.StringConstants.jumpPrefixKey)
        dieFrames = AnimationHelper.loadTextures(from: SKTextureAtlas(named: GameConstants.StringConstants.playerDieAtlas), withName: GameConstants.StringConstants.diePrefixKey)
    }
    
    func animate(for state: PlayerState) {
        removeAllActions()
        switch state {
        case .idle:
            self.run(SKAction.repeatForever(SKAction.animate(with: idleFrames, timePerFrame: 0.05, resize: true, restore: true)))
        case .running:
            self.run(SKAction.repeatForever(SKAction.animate(with: runFrames, timePerFrame: 0.05, resize: true, restore: true)))
        }
    }
    
    func activatePowerup(active: Bool) {
        if active {
            if let powerupEffect = ParticleHelper.addParticleEffect(name: GameConstants.StringConstants.powerupEmitterKey, particlePositionRange: CGVector(dx: 0.0, dy: size.height), position: CGPoint(x: -size.width, y: 0.0)) {
                powerupEffect.zPosition = GameConstants.ZPositions.objectZ
                addChild(powerupEffect)
                invincible = true
                run(SKAction.wait(forDuration: 5.0), completion: { 
                    self.activatePowerup(active: false)
                })
            }
        } else {
            invincible = false
            ParticleHelper.removeParticleEffect(name: GameConstants.StringConstants.powerupEmitterKey, from: self)
        }
    }
    
}






















