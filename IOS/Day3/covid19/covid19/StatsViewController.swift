//
//  StatsViewController.swift
//  covid19
//
//  Created by Sw2x on 3/8/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

  
    @IBOutlet weak var DateTimeLabel: UILabel!
    @IBOutlet weak var CasesLabel: UILabel!
    @IBOutlet weak var DeathsLabel: UILabel!
    @IBOutlet weak var RecoveredLabel: UILabel!
    @IBOutlet weak var Loadingthing: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DateTimeLabel.text = (DateTimeLabel.text ?? "تاريخ الاحصائيات:") + "\n" + getTodayString()
        Loadingthing.startAnimating()
      
    }
    

    func getTodayString() -> String{

               let date = Date()
               let calender = Calendar.current
               let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)

               let year = components.year
               let month = components.month
               let day = components.day
               let hour = components.hour
               let minute = components.minute
               let second = components.second

        let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + (minute! < 10 ? String(0) + String(minute!) : String(minute!)) + ":" +  String(second!)

               return today_string

           }
    

}
