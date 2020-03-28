//
//  ResturantDetailViewController.swift
//  GimmeFood
//
//  Created by Sw2x on 3/28/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class ResturantDetailViewController: UIViewController {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var ResturantName: UILabel!
    
    @IBOutlet weak var Status: UILabel!
    
    
    var restu: Resturant = Resturant.init(name: "Resturant Name", ImageURL: "", Image: UIImage(), status: "Status")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ImageView.image = restu.Image
        ResturantName.text = restu.name
        Status.text = restu.status
    }
    

    
    @IBAction func ButtonClick(_ sender: Any) {
 
                              let webURL = URL(string: "https://talabat.com")!
                                        UIApplication.shared.open(webURL)
                          
                      
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
