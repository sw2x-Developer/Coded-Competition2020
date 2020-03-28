//
//  ResturantCell.swift
//  GimmeFood
//
//  Created by Sw2x on 3/24/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import Foundation
import UIKit

public var arrayOfOffers:[Offer] = []

public class Offer {
    
    var name:String
    var ImageURL:String
    var Image:UIImage
    var offer:String
    
    init(name:String , ImageURL:String ,offer:String) {
        self.name = name
        self.ImageURL = ImageURL
        self.Image = UIImage.downloadfromurl(url: self.ImageURL)
        self.offer = offer
        arrayOfOffers.append(self)
        
    }


}
