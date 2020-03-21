//
//  MultiplayerViewController.swift
//  TicTacToeV2
//
//  Created by Sw2x on 3/21/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class MultiplayerViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayofbuttons = [self.B1 , self.B2 , self.B3 , self.B4 , self.B5 , self.B6 , self.B7 , self.B8 , self.B9]
               navigationController?.setNavigationBarHidden(false, animated: true)
              
           }
    

 func Reset(){
       turn = 0
       for but in arrayofbuttons {
           but.isUserInteractionEnabled = true
           but.setTitle("", for: .normal)
       }
   }

   @IBAction func ResetButton(_ sender: Any) {
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
        
        if turn % 2 == 0 {
            sender.setTitle("X", for: .normal)
            sender.isUserInteractionEnabled = false
        }else{
            sender.setTitle("O", for: .normal)
            sender.isUserInteractionEnabled = false
        }
        
        turn += 1
        if (checkWinner("X") == "X"){
              print("X won")
              String.popAlert(presenter: self, Title: "Winner winner chicken dinner", message: "Player X Won." , actionString: "Congratzzz")
              Reset()
          }else if (checkWinner("O") == "O"){
              print("O won")
              String.popAlert(presenter: self, Title: "Winner winner chicken dinner", message: "Player O Won." , actionString: "Ma maaaan")
              Reset()
          }else {
              if turn == 9 {
              print("Tie")
                  String.popAlert(presenter: self, Title: "Tie", message: "It's a tie." , actionString: "Damn!")
              Reset()
              }
          }
    }
    
}
