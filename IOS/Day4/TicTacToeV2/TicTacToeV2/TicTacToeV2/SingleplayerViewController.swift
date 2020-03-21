//
//  SingleplayerViewController.swift
//  TicTacToeV2
//
//  Created by Sw2x on 3/21/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

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
       
            sender.setTitle("X", for: .normal)
            sender.isUserInteractionEnabled = false
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
            String.popAlert(presenter: self, Title: "Winner winner chicken dinner", message: "Player X Won." , actionString: "Letttt'ssssss GOOOOOOO")
            Reset()
        }else if (checkWinner("O") == "O"){
            print("O won")
            String.popAlert(presenter: self, Title: "Winner winner chicken dinner", message: "Player O Won." , actionString: "Oh Maaaan :(")
            Reset()
        }else {
            if turn == 5 {
            print("Tie")
                String.popAlert(presenter: self, Title: "Tie", message: "It's a tie." , actionString: "Damn!")
            Reset()
            }
        }
       
        
    }
    
    
}


extension String {
    static func popAlert(presenter: UIViewController, Title: String , message: String , actionString: String)
    {
        let alertController = UIAlertController(title: Title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: actionString, style: .cancel, handler: nil)
        alertController.addAction(okAction)
        presenter.present(alertController, animated: true)
    }
    
}
