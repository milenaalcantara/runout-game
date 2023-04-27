//
//  GameHUD.swift
//  Runout
//

import SpriteKit

class GameHUD: SKSpriteNode, HUDDelegate {
    
    var coinLabel: SKLabelNode
    var superCoinCounter: SKSpriteNode
    var superCoinCount: Int = 3
    
    init(with size: CGSize) {
        coinLabel = SKLabelNode(fontNamed: GameConstants.StringConstants.gameFontName)
        superCoinCounter = SKSpriteNode(texture: nil, color: UIColor.clear, size: CGSize(width: size.width*0.3, height: size.height*0.8))
        
        super.init(texture: nil, color: UIColor.clear, size: size)
        
        coinLabel.verticalAlignmentMode = .center
        coinLabel.text = "0"
        coinLabel.fontSize = 200.0
        coinLabel.scale(to: frame.size, width: false, multiplier: 0.8)
        coinLabel.position = CGPoint(x: frame.maxX - coinLabel.frame.size.width*2, y: frame.midY - 40)
        coinLabel.zPosition = GameConstants.ZPositions.hudZ
        addChild(coinLabel)
        
        superCoinCounter.position = CGPoint(x: frame.minX + superCoinCounter.frame.size.width/2, y: frame.midY)
        superCoinCounter.zPosition = GameConstants.ZPositions.hudZ
        addChild(superCoinCounter)
        
        let superCoinCounterHalf = superCoinCounter.size.width/2
        let superCoinCounterTriple = superCoinCounter.size.width/3
        let superCoinCounterSmall = superCoinCounter.size.width*0.05
        
        for i in 0..<3 {
            let emptySlot = SKSpriteNode(imageNamed: GameConstants.StringConstants.superCoinImageName)
            emptySlot.name = String(i)
            emptySlot.alpha = 1
            emptySlot.scale(to: superCoinCounter.size, width: true, multiplier: 0.3)
            let xPos = -superCoinCounterHalf + emptySlot.size.width/2 + CGFloat(i)*superCoinCounterTriple + superCoinCounterSmall
            emptySlot.position = CGPoint(x: xPos, y: superCoinCounter.frame.midY - 40)
            emptySlot.zPosition = GameConstants.ZPositions.hudZ
            superCoinCounter.addChild(emptySlot)
        }
        
        addSuperCoin(index: 0)
        addSuperCoin(index: 1)
        addSuperCoin(index: 2)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCoinLabel(coins: Int) {
        coinLabel.text = "\(coins)"
    }
    
    func removeSuperCoin(index: Int) {
        let emptySlot = superCoinCounter[String(index)].first as! SKSpriteNode
        emptySlot.alpha = 0.5
        if superCoinCount > 0 && superCoinCount <= 3 {
            superCoinCount-=1
        }
    }
    
    func addSuperCoin(index: Int) {
        let emptySlot = superCoinCounter[String(index)].first as! SKSpriteNode
        emptySlot.alpha = 1
        if superCoinCount > 0 && superCoinCount < 3 {
            superCoinCount+=1
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
