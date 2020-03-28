//
//  ResturantCell.swift
//  GimmeFood
//
//  Created by Sw2x on 3/24/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import Foundation
import UIKit


public class Resturant {
    
    var name:String
    var ImageURL:String
    var Image:UIImage
    var status:String
    
    init(name:String , ImageURL:String ,Image:UIImage ,status:String) {
        self.name = name
        self.Image = Image
        self.ImageURL = ImageURL
        self.status = status
        
    }


}
