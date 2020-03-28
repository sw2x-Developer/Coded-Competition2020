//
//  CharsViewController.swift
//  MarioParty
//
//  Created by Sw2x on 3/24/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation


class CharsViewController: UIViewController {

    @IBOutlet weak var StarsImage: UIImageView!
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var BackgroundImage: UIImageView!
    @IBOutlet weak var CharImage: UIImageView!
    var stars: [UIImage] = [#imageLiteral(resourceName: "Star1") , #imageLiteral(resourceName: "Star2") , #imageLiteral(resourceName: "Star3") , #imageLiteral(resourceName: "Star4") , #imageLiteral(resourceName: "Star5")]
    var player: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NameLabel.text = currentName
        BackgroundImage.image = currentBackground
        CharImage.image = currentImage
    }

    @IBAction func Musicc(_ sender: UIButton) {
        print(currentMusic)
        playMusicc(musicName: currentMusic , type: "WAV")
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
    
    @IBAction func Random(_ sender: UIButton) {
        StarsImage.image = stars.randomElement()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

