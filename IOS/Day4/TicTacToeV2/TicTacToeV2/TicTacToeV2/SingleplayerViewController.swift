//
//  SingleplayerViewController.swift
//  TicTacToeV2
//
//  Created by Sw2x on 3/21/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import AVFoundation
import UIKit

class SingleplayerViewController: UIViewController {

    
    @IBOutlet weak var B1: CustomButton!
    @IBOutlet weak var B2: CustomButton!
    @IBOutlet weak var B3: CustomButton!
    @IBOutlet weak var B4: CustomButton!
    @IBOutlet weak var B5: CustomButton!
    @IBOutlet weak var B6: CustomButton!
    @IBOutlet weak var B7: CustomButton!
    @IBOutlet weak var B8: CustomButton!
    @IBOutlet weak var B9: CustomButton!
    var arrayofbuttons: [CustomButton] = []
    var turn: Int = 0
    var XWon: Int = 0
    var OWon: Int = 0
    
    var audioPlayer = AVAudioPlayer()
     var audioPlayer2 = AVAudioPlayer()
       
       func playSoundd() {
           guard let sound = Bundle.main.path(forResource: "coin", ofType: "mp3") else {
               print("error to get the mp3 file")
               return
           }
           do {
               audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
           } catch {
               print("audio file error")
           }
           audioPlayer.play()
        
       }
       

    func playMusic() {
        guard let sound = Bundle.main.path(forResource: "GameSound", ofType: "mp3") else {
            print("error to get the mp3 file")
            return
        }
        do {
            audioPlayer2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
        } catch {
            print("audio file error")
        }
           audioPlayer2.numberOfLoops = Int.max
        audioPlayer2.play()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayofbuttons = [self.B1 , self.B2 , self.B3 , self.B4 , self.B5 , self.B6 , self.B7 , self.B8 , self.B9]
        navigationController?.setNavigationBarHidden(false, animated: true)
       playMusic()
    }
    
    func Reset(){
        turn = 0
        for but in arrayofbuttons {
            but.isUserInteractionEnabled = true
            but.setTitle("", for: .normal)
        }
        if XWon >= 3 {
            XWon = 0
            OWon = 0
        }else if OWon >= 3 {
            XWon = 0
            OWon = 0
        }else if XWon + OWon >= 3 {
            XWon = 0
            OWon = 0
            if XWon > OWon {
                String.popAlert(presenter: self, Title: "Status", message: "X Won the match of 3 rounds", actionString: "OK" , what: {_ in })
            }else if OWon > XWon {
                      String.popAlert(presenter: self, Title: "Status", message: "O Won the match of 3 rounds", actionString: "OK", what: {_ in })
            }else{
                      String.popAlert(presenter: self, Title: "Status", message: "Tie", actionString: "OK", what: {_ in })
            }
        }
    }

    @IBAction func ResetButton(_ sender: Any) {
        Vibration.heavy.vibrate()
        Reset()
    }
    
    func checkWinner(_ which: String) -> String{
        var one: Bool = B1.title(for: .normal) == which && B2.title(for: .normal) == which && B3.title(for: .normal) == which
        var two: Bool = B4.title(for: .normal) == which && B5.title(for: .normal) == which && B6.title(for: .normal) == which
        var three: Bool = B7.title(for: .normal) == which && B8.title(for: .normal) == which && B9.title(for: .normal) == which
        var four: Bool = B1.title(for: .normal) == which && B4.title(for: .normal) == which && B7.title(for: .normal) == which
        var fife: Bool = B2.title(for: .normal) == which && B5.title(for: .normal) == which && B8.title(for: .normal) == which
        var six: Bool = B3.title(for: .normal) == which && B6.title(for: .normal) == which && B9.title(for: .normal) == which
        var seven: Bool = B1.title(for: .normal) == which && B5.title(for: .normal) == which && B9.title(for: .normal) == which
        var eight: Bool = B3.title(for: .normal) == which && B5.title(for: .normal) == which && B7.title(for: .normal) == which
        
        
        if (one || two || three || four || fife || six || seven || eight){
            
            return which
            
        }else{
            return "Tie"
        }

    }
    
    @IBAction func ButtonsClick(_ sender: CustomButton) {
       
            sender.setTitle("X", for: .normal)
            sender.isUserInteractionEnabled = false
        Vibration.warning.vibrate()
        
        if turn != 4 {
            
            var done = false
                 while done == false {
                     let daitem = arrayofbuttons.randomElement()
                     if daitem!.isUserInteractionEnabled == true {
                         done = true
                         daitem!.isUserInteractionEnabled = false
                         daitem?.setTitle("O", for: .normal)
                     }
                 }
        }
 
       turn += 1
        if (checkWinner("X") == "X"){
            print("X won")
            XWon += 1
            playSoundd()
            Vibration.success.vibrate()
            String.popAlert(presenter: self, Title: "Winner winner chicken dinner", message: "Player X Won." , actionString: "Letttt'ssssss GOOOOOOO" , what:    {(action) -> Void in
                
                String.popAlert(presenter: self, Title: "Status", message: "X wins : \(self.XWon) | O wins : \(self.OWon)", actionString: "OK", what: {_ in self.Reset()})
                Vibration.oldSchool.vibrate()
               
                
            })
                
          
            
        }else if (checkWinner("O") == "O"){
            print("O won")
            OWon += 1
    
            Vibration.success.vibrate()
            String.popAlert(presenter: self, Title: "Winner winner chicken dinner", message: "Player O Won." , actionString: "Oh Maaaan :(", what: { _ in
                
                
                String.popAlert(presenter: self, Title: "Status", message: "X wins : \(self.XWon) | O wins : \(self.OWon)", actionString: "OK" , what: {_ in self.Reset()})
                              Vibration.oldSchool.vibrate()
                
            })
            
          
        }else {
            if turn == 5 {
            print("Tie")
        
                   Vibration.oldSchool.vibrate()
                String.popAlert(presenter: self, Title: "Tie", message: "It's a tie." , actionString: "Damn!", what: {_ in
                    
                    String.popAlert(presenter: self, Title: "Status", message: "X wins : \(self.XWon) | O wins : \(self.OWon)", actionString: "OK" , what: {_ in
                        
                        self.Reset()
                    })
                    Vibration.oldSchool.vibrate()
                   
                    
                })
             
                
            }
        }
       
        
    }
    
    
}


extension String {
    static func popAlert(presenter: UIViewController, Title: String , message: String , actionString: String , what: @escaping (UIAlertAction) -> Void = {_ in })
    {
        let alertController = UIAlertController(title: Title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: actionString, style: .cancel, handler: what)
        alertController.addAction(okAction)
        presenter.present(alertController, animated: true)
    }
    
}
