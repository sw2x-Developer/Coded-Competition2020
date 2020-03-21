//
//  GameScene.swift
//  TicTacToe
//
//  Created by Sw2x on 3/17/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene , Alertable {
    
 
    var counter: Int = 0
    var scoreofx: Int = 0
    var scoreofy: Int = 0
    
    override func sceneDidLoad() {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        for node in self.children {
            guard let snode = node as? SKSpriteNode else { continue }
            snode.color = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }


    
    
    func reset(){
        counter = 0
        scoreofx = 0
        scoreofy = 0
        
        for node in self.children {
            guard let snode = node as? SKSpriteNode else { continue }
            snode.color = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            snode.removeAllChildren()
            snode.isUserInteractionEnabled = false
        }
        
    }
    
 
    
    func checkforthewinner(){
        var isitfull: Int = 0
        for node in self.children {
            guard let snode = node as? SKSpriteNode else { continue }
            for thetext in snode.children {
                guard let text = thetext as? SKLabelNode else { continue }
                print("Node Name : \(snode.name!) | Value : \(text.text!)")
                isitfull += 1
                if isitfull == 9 {
                    showAlert(withTitle: "He won", message: "Alert message")
                    reset()
                }
                
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let positionInScene = touch.location(in: self)
            let touchedNodes = self.nodes(at: positionInScene)
            
            for touchedNode in touchedNodes {
                if let name = touchedNode.name {
                    if name == "reset"{
                        reset()
                    }else{
                    if counter % 2 == 0 {
                        guard let thebutton = self.childNode(withName: name) as? SKSpriteNode else { continue }
                        if thebutton.isUserInteractionEnabled == false {
                            
                        let XText = SKLabelNode(text: "X")
                            XText.position = CGPoint(x: 0 , y: -12.5)
                        thebutton.addChild(XText)
                        thebutton.color = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                        thebutton.isUserInteractionEnabled = true
                        }
                        
                   
                    }else{
                        guard let thebutton = self.childNode(withName: name) as? SKSpriteNode else { continue }
                           if thebutton.isUserInteractionEnabled  == false{
                            let OText = SKLabelNode(text: "O")
                            OText.position = CGPoint(x: 0 , y: -12.5)
                            thebutton.addChild(OText)
                       thebutton.color = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                        thebutton.isUserInteractionEnabled = true
                        }
                        
                    }
                    counter += 1
                    checkforthewinner()
                    }
                }
            }
            
            }
            
        }
        
    }
    


