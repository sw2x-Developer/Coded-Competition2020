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
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .dark
        } else {
            // Fallback on earlier versions
        }
        }

    override func viewWillAppear(_ animated: Bool) {
         navigationController?.setNavigationBarHidden(true, animated: animated)
         
    }
    
    @IBAction func SwitchMode(_ sender: UISwitch) {
        if sender.isOn {
            if #available(iOS 13.0, *) {
                overrideUserInterfaceStyle = .dark
            } else {
                String.popAlert(presenter: self, Title: "Dark Mode", message: "Sorry , Dark mode is only available for IOS 13.0 and up", actionString: ":(")
            }
        }else{
            if #available(iOS 13.0, *) {
                overrideUserInterfaceStyle = .light
            } else {
                    String.popAlert(presenter: self, Title: "Dark Mode", message: "Sorry , Dark mode is only available for IOS 13.0 and up", actionString: ":(")
            }
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if daSwitch.isOn{
            if #available(iOS 13.0, *) {
                segue.destination.overrideUserInterfaceStyle = .dark
            }
        }else{
            if #available(iOS 13.0, *) {
                segue.destination.overrideUserInterfaceStyle = .light
            }
        }
    }
    
}

