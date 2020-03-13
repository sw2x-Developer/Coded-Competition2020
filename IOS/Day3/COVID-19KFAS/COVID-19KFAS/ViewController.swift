//
//  ViewController.swift
//  COVID-19KFAS
//
//  Created by Sw2x on 3/10/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var English: UIButton!
    @IBOutlet weak var Arabic: UIButton!
    var Languagee: String = "Arabic"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       navigationItem.hidesBackButton = true
        
    }

    @IBAction func EnglishButton(_ sender: UIButton) {
        Languagee = "English"
        English.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).withAlphaComponent(0.5)
        Arabic.backgroundColor = nil
    }
    
    @IBAction func ArabicButton(_ sender: Any) {
        Languagee = "Arabic"
        Arabic.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).withAlphaComponent(0.5)
        English.backgroundColor = nil
    }
    
    

    
}

