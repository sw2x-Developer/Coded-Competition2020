//
//  ViewController.swift
//  TicTacToeV2
//
//  Created by Sw2x on 3/21/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var singlebutton: UIButton!
    @IBOutlet weak var daSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        }

    override func viewWillAppear(_ animated: Bool) {
         navigationController?.setNavigationBarHidden(true, animated: animated)
         
    }
    
    @IBAction func SwitchMode(_ sender: UISwitch) {
        if sender.isOn {
            overrideUserInterfaceStyle = .dark
        }else{
            overrideUserInterfaceStyle = .light
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if daSwitch.isOn{
        segue.destination.overrideUserInterfaceStyle = .dark
        }else{
            segue.destination.overrideUserInterfaceStyle = .light
        }
    }
    
}

