//
//  GameElements.swift
//  Flappy Omar
//
//  Created by Sw2x on 2/17/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import SpriteKit
 
struct CollisionBitMask {
    static let OmarCategory:UInt32 = 0x1 << 0
    static let pillarCategory:UInt32 = 0x1 << 1
    static let CoinCategory:UInt32 = 0x1 << 2
    static let groundCategory:UInt32 = 0x1 << 3
}
 
extension GameScene {
    
    func createOmar() -> SKSpriteNode {
            let Omar = SKSpriteNode(texture: SKTextureAtlas(named:"player2").textureNamed("Omar1"))
            Omar.size = CGSize(width: 50, height: 50)
            Omar.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
            Omar.physicsBody = SKPhysicsBody(circleOfRadius: Omar.size.width / 2)
            Omar.physicsBody?.linearDamping = 1.1
            Omar.physicsBody?.restitution = 0
            Omar.physicsBody?.categoryBitMask = CollisionBitMask.OmarCategory
            Omar.physicsBody?.collisionBitMask = CollisionBitMask.pillarCategory | CollisionBitMask.groundCategory
            Omar.physicsBody?.contactTestBitMask = CollisionBitMask.pillarCategory | CollisionBitMask.CoinCategory | CollisionBitMask.groundCategory
            Omar.physicsBody?.affectedByGravity = false
            Omar.physicsBody?.isDynamic = true
            
            return Omar
    }
    
    func createRestartBtn() {
       let taptoplayLbl = SKLabelNode()
           taptoplayLbl.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 100)
           taptoplayLbl.text = "Tap to play"
           taptoplayLbl.fontColor = UIColor(red: 63/255, green: 79/255, blue: 145/255, alpha: 1.0)
           taptoplayLbl.zPosition = 5
           taptoplayLbl.fontSize = 20
           taptoplayLbl.fontName = "HelveticaNeue"
           self.addChild(taptoplayLbl)
       }
    
       func createScoreLabel() -> SKLabelNode {
           let scoreLbl = SKLabelNode()
           scoreLbl.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + self.frame.height / 2.6)
           scoreLbl.text = "\(score)"
           scoreLbl.zPosition = 5
           scoreLbl.fontSize = 50
           scoreLbl.fontName = "HelveticaNeue-Bold"
       
           return scoreLbl
       }
       func createHighscoreLabel() -> SKLabelNode {
           let highscoreLbl = SKLabelNode()
           highscoreLbl.position = CGPoint(x: self.frame.width - 80, y: self.frame.height - 90)
           if let highestScore = UserDefaults.standard.object(forKey: "highestScore"){
               highscoreLbl.text = "High Score: \(highestScore)"
           } else {
               highscoreLbl.text = "High Score: 0"
           }
           highscoreLbl.zPosition = 5
           highscoreLbl.fontSize = 15
           highscoreLbl.fontName = "Helvetica-Bold"
           return highscoreLbl
       }
       func createTaptoplayLabel() -> SKLabelNode {
           let taptoplayLbl = SKLabelNode()
           taptoplayLbl.position = CGPoint(x:self.frame.midX, y:self.frame.midY - 100)
           taptoplayLbl.text = "Tap to play"
           taptoplayLbl.fontColor = UIColor(red: 63/255, green: 79/255, blue: 145/255, alpha: 1.0)
           taptoplayLbl.zPosition = 5
           taptoplayLbl.fontSize = 20
           taptoplayLbl.fontName = "HelveticaNeue"
           return taptoplayLbl
       }
    
    func createWalls() -> SKNode  {
            let coinNode = SKSpriteNode(imageNamed: "Coin")
            coinNode.size = CGSize(width: 40, height: 40)
            coinNode.position = CGPoint(x: self.frame.width + 25, y: self.frame.height / 2)
            coinNode.physicsBody = SKPhysicsBody(rectangleOf: coinNode.size)
            coinNode.physicsBody?.affectedByGravity = false
            coinNode.physicsBody?.isDynamic = false
            coinNode.physicsBody?.categoryBitMask = CollisionBitMask.CoinCategory
            coinNode.physicsBody?.collisionBitMask = 0
            coinNode.physicsBody?.contactTestBitMask = CollisionBitMask.OmarCategory
            coinNode.color = SKColor.blue
            wallPair = SKNode()
            wallPair.name = "wallPair"
            
            let topWall = SKSpriteNode(imageNamed: "pillar")
            let btmWall = SKSpriteNode(imageNamed: "pillar")
            
            topWall.position = CGPoint(x: self.frame.width + 60, y: self.frame.height / 2 + 420)
            btmWall.position = CGPoint(x: self.frame.width + 60, y: self.frame.height / 2 - 420)
            
            topWall.setScale(0.5)
            btmWall.setScale(0.5)
            
            topWall.physicsBody = SKPhysicsBody(rectangleOf: topWall.size)
            topWall.physicsBody?.categoryBitMask = CollisionBitMask.pillarCategory
            topWall.physicsBody?.collisionBitMask = CollisionBitMask.OmarCategory
            topWall.physicsBody?.contactTestBitMask = CollisionBitMask.OmarCategory
            topWall.physicsBody?.isDynamic = false
            topWall.physicsBody?.affectedByGravity = false
            
            btmWall.physicsBody = SKPhysicsBody(rectangleOf: btmWall.size)
            btmWall.physicsBody?.categoryBitMask = CollisionBitMask.pillarCategory
            btmWall.physicsBody?.collisionBitMask = CollisionBitMask.OmarCategory
            btmWall.physicsBody?.contactTestBitMask = CollisionBitMask.OmarCategory
            btmWall.physicsBody?.isDynamic = false
            btmWall.physicsBody?.affectedByGravity = false
            
            topWall.zRotation = CGFloat(M_PI)
            
            wallPair.addChild(topWall)
            wallPair.addChild(btmWall)
            
            wallPair.zPosition = 1
            // 3
            let randomPosition = random(min: -200, max: 200)
            wallPair.position.y = wallPair.position.y +  randomPosition
            wallPair.addChild(coinNode)
            
            wallPair.run(moveAndRemove)
            
            return wallPair
    }
    func random() -> CGFloat{
            return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    func random(min : CGFloat, max : CGFloat) -> CGFloat{
            return random() * (max - min) + min
    }
    
}
