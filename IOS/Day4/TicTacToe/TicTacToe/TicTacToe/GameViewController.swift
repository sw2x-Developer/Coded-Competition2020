//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Sw2x on 3/17/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene =  GameScene(fileNamed: "GameScene"){
            let skView = self.view as! SKView
            skView.showsNodeCount = true
            skView.showsFPS = true
            
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }

}
