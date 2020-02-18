//
//  GameViewController.swift
//  Flappy Omar
//
//  Created by Sw2x on 2/15/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import SpriteKit
 
class GameViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = false
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
 
   override var shouldAutorotate: Bool {
        return false
    }
 
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
