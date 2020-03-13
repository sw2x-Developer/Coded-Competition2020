//
//  StatsViewController.swift
//  COVID-19KFAS
//
//  Created by Sw2x on 3/11/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    
    @IBOutlet weak var CasesLabel: UILabel!
    
    @IBOutlet weak var KuwaitCases: UILabel!
    
    @IBOutlet weak var RecoverdLabel: UILabel!
    
    @IBOutlet weak var DeathsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CasesLabel.text = ""
        KuwaitCases.text = ""
        RecoverdLabel.text = ""
        DeathsLabel.text = ""
        // Do any additional setup after loading the view.
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

var vSpinner : UIView?
 
extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
