//
//  GameScene.swift
//  Flappy Omar
//
//  Created by Sw2x on 2/15/20.
//  Copyright © 2020 Sw2x. All rights reserved.

import SpriteKit
import UIKit
import AudioToolbox
 
class GameScene: SKScene , SKPhysicsContactDelegate {
    
    var isStarted = false
    var isDead = false
    let Sound = SKAction.playSoundFileNamed("Coin.mp3", waitForCompletion: false)
    var score = 0
    var scoreLbl = SKLabelNode()
    var highscoreLbl = SKLabelNode()
    var taptoplayLbl = SKLabelNode()
    var restart = false
    var wallPair = SKNode()
    var moveAndRemove = SKAction()
     
    var backgroundMusic: SKAudioNode!
    func playmusic(){
        
        if let musicURL = Bundle.main.url(forResource: "Godzilla", withExtension: "mp3") {
            backgroundMusic = SKAudioNode(url: musicURL)
            addChild(backgroundMusic)
        }
        
    }
    
    let OmarAtlas = SKTextureAtlas(named:"player2")
    var OmarSprites = Array<Any>()
    var Omar = SKSpriteNode()
    var repeatActionOmar = SKAction()
    
    
    func createScene(){
       self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
       self.physicsBody?.categoryBitMask = CollisionBitMask.groundCategory
       self.physicsBody?.collisionBitMask = CollisionBitMask.OmarCategory
       self.physicsBody?.contactTestBitMask = CollisionBitMask.OmarCategory
       self.physicsBody?.isDynamic = false
       self.physicsBody?.affectedByGravity = false
     
       self.physicsWorld.contactDelegate = self
       self.backgroundColor = SKColor(red: 80.0/255.0, green: 192.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        for i in 0...2
        {
                    let background = SKSpriteNode(imageNamed: "Bg")
                    background.anchorPoint = CGPoint.init(x: 0, y: 0)
                    background.position = CGPoint(x:CGFloat(i) * self.frame.width, y:0)
                    background.name = "background"
                    background.size = (self.view?.bounds.size)!
                    self.addChild(background)
        }


        OmarSprites.append(OmarAtlas.textureNamed("Omar1"))
        OmarSprites.append(OmarAtlas.textureNamed("Omar2"))
        OmarSprites.append(OmarAtlas.textureNamed("Omar3"))
        OmarSprites.append(OmarAtlas.textureNamed("Omar4"))
        self.Omar = createOmar()
        self.addChild(Omar)
                
        //PREPARE TO ANIMATE THE Omar AND REPEAT THE ANIMATION FOREVER
        let animateOmar = SKAction.animate(with: self.OmarSprites as! [SKTexture], timePerFrame: 0.1)
        self.repeatActionOmar = SKAction.repeatForever(animateOmar)
        scoreLbl = createScoreLabel()
        self.addChild(scoreLbl)
         
        highscoreLbl = createHighscoreLabel()
        self.addChild(highscoreLbl)
         
    
         
        taptoplayLbl = createTaptoplayLabel()
        self.addChild(taptoplayLbl)
    }

    
   override func didMove(to view: SKView) {
        createScene()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
            let firstBody = contact.bodyA
            let secondBody = contact.bodyB
            
            if firstBody.categoryBitMask == CollisionBitMask.OmarCategory && secondBody.categoryBitMask == CollisionBitMask.pillarCategory || firstBody.categoryBitMask == CollisionBitMask.pillarCategory && secondBody.categoryBitMask == CollisionBitMask.OmarCategory || firstBody.categoryBitMask == CollisionBitMask.OmarCategory && secondBody.categoryBitMask == CollisionBitMask.groundCategory || firstBody.categoryBitMask == CollisionBitMask.groundCategory && secondBody.categoryBitMask == CollisionBitMask.OmarCategory{
                enumerateChildNodes(withName: "wallPair", using: ({
                    (node, error) in
                    node.speed = 0
                    self.removeAllActions()
                }))
                if isDead == false{
                  
                    isDead = true
                    backgroundMusic.run(SKAction.stop())
                    restart = true
                    createRestartBtn()
                    self.Omar.removeAllActions()
                }
            } else if firstBody.categoryBitMask == CollisionBitMask.OmarCategory && secondBody.categoryBitMask == CollisionBitMask.CoinCategory {
                if(isDead == false){
                run(Sound)
                score += 1
                scoreLbl.text = "\(score)"
                 AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
                secondBody.node?.removeFromParent()
                }
            } else if firstBody.categoryBitMask == CollisionBitMask.CoinCategory && secondBody.categoryBitMask == CollisionBitMask.OmarCategory {
                if(isDead == false){
                run(Sound)
                score += 1
                scoreLbl.text = "\(score)"
                 AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
                firstBody.node?.removeFromParent()
                }
            }
    }
    
    func restartScene(){
        self.removeAllChildren()
        self.removeAllActions()
        isDead = false
        isStarted = false
        score = 0
        createScene()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isStarted == false{
               //1
               isStarted =  true
               playmusic()
               Omar.physicsBody?.affectedByGravity = true
       
               taptoplayLbl.removeFromParent()
              //3
               self.Omar.run(repeatActionOmar)
        
             let spawn = SKAction.run({
                  () in
                  self.wallPair = self.createWalls()
                  self.addChild(self.wallPair)
              })
              //2
              let delay = SKAction.wait(forDuration: 1.5)
              let SpawnDelay = SKAction.sequence([spawn, delay])
              let spawnDelayForever = SKAction.repeatForever(SpawnDelay)
              self.run(spawnDelayForever)
              //3
              let distance = CGFloat(self.frame.width + wallPair.frame.width)
              let movePillars = SKAction.moveBy(x: -distance - 50, y: 0, duration: TimeInterval(0.008 * distance))
              let removePillars = SKAction.removeFromParent()
              moveAndRemove = SKAction.sequence([movePillars, removePillars])
               Omar.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
               Omar.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 40))
           } else {
               //4
               if isDead == false {
                   Omar.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                   Omar.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 40))
               }
           }
        
        for _ in touches{
            
            
            if isDead == true{
                if restart{
                    if UserDefaults.standard.object(forKey: "highestScore") != nil {
                        let hscore = UserDefaults.standard.integer(forKey: "highestScore")
                        if hscore < Int(scoreLbl.text!)!{
                            UserDefaults.standard.set(scoreLbl.text, forKey: "highestScore")
                        }
                    } else {
                        UserDefaults.standard.set(0, forKey: "highestScore")
                    }
                    restartScene()
                }
            }
        }
        
    }
    
    
    
   override func update(_ currentTime: TimeInterval) {
    
            if isStarted == true{
                if isDead == false{
                    enumerateChildNodes(withName: "background", using: ({
                        (node, error) in
                        let bg = node as! SKSpriteNode
                        bg.position = CGPoint(x: bg.position.x - 2, y: bg.position.y)
                        if bg.position.x <= -bg.size.width {
                            bg.position = CGPoint(x:bg.position.x + bg.size.width * 2, y:bg.position.y)
                        }
                    }))
                }
            }
    }
    
}
