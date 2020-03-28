//
//  OffersTableViewCell.swift
//  GimmeFood
//
//  Created by Sw2x on 3/28/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class OffersTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Offer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        Name.text = nil
        Offer.text = nil
    }

}
