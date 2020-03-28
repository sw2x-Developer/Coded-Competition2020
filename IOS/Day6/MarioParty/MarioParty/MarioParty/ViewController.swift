//
//  ViewController.swift
//  MarioParty
//
//  Created by Dalal Alhazeem on 3/24/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
   

    

    
    @IBOutlet weak var BackImage: UIImageView!
    var player: AVAudioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //nextButton.isUserInteractionEnabled = false
        
        let Luigi:Charecters = .init(name: "Luigi", background: #imageLiteral(resourceName: "LuigiBG") , music: "LUIGI_3", Image: #imageLiteral(resourceName: "luigi"))
        let Mario:Charecters = .init(name: "Mario", background: #imageLiteral(resourceName: "MarioBG") , music: "MARIO_3", Image: UIImage.gifImageWithName("giphy") ?? #imageLiteral(resourceName: "Mario"))
        let Peach:Charecters = .init(name: "Peach", background: #imageLiteral(resourceName: "PeachBG") , music: "PEACH_3", Image: #imageLiteral(resourceName: "peach"))
        let Waluigi:Charecters = .init(name: "Waluigi", background: #imageLiteral(resourceName: "WaluigiBG") , music: "WALUIGI_3", Image: #imageLiteral(resourceName: "waluigi"))
        let Yoshi:Charecters = .init(name: "Yoshi", background: #imageLiteral(resourceName: "YoshiBG") , music: "YOSHI_2", Image: #imageLiteral(resourceName: "yoshi"))
        let Bowser:Charecters = .init(name: "Bowser", background: #imageLiteral(resourceName: "BowserBG") , music: "BOWSER_3", Image: #imageLiteral(resourceName: "Bowser"))
        let Koopa:Charecters = .init(name: "Koopa", background: #imageLiteral(resourceName: "KoopaBG") , music: "Koopa", Image: #imageLiteral(resourceName: "kupaTrupa"))
        
        arrayofchars.append(Luigi)
        arrayofchars.append(Mario)
        arrayofchars.append(Peach)
        arrayofchars.append(Waluigi)
        arrayofchars.append(Yoshi)
        arrayofchars.append(Bowser)
        arrayofchars.append(Koopa)
        
        currentName = Mario.name
        currentImage = Mario.Image
        currentMusic = Mario.music
        currentBackground = Mario.background
        
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        BackImage.image = currentImage
    }
    
    @IBAction func ButtonClc(_ sender: Any) {
        let newchar = chooseRandomCharcter()
        BackImage.image = newchar.Image
        currentName = newchar.name
        currentImage = newchar.Image
        currentMusic = newchar.music
        currentBackground = newchar.background
        
    }
    func playMusicc(musicName: String, type: String = "", loop: Int = 0)
           {
              
               let AssortedMusics = URL(fileURLWithPath: Bundle.main.path(forResource: musicName, ofType: type)!)
               player = try! AVAudioPlayer(contentsOf: AssortedMusics)
               player.prepareToPlay()
               player.numberOfLoops = loop
               player.volume = 0.5
               player.play()
           }
   
    
    override func viewWillAppear(_ animated: Bool) {
              let randchar:Charecters = chooseRandomCharcter()
          BackImage.image = randchar.Image
          currentImage = randchar.Image
          currentName = randchar.name
          currentMusic = randchar.music
          currentBackground = randchar.background
        playMusicc(musicName: "BG", type: "wav")
    }
    
    func chooseRandomCharcter() -> Charecters{
        let randint:Int = Int.random(in: 0 ... arrayofchars.count - 1)
            
        return arrayofchars[randint]
    }
    


    
    
    
}




