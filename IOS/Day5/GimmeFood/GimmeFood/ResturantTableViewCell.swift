//
//  ResturantTableViewCell.swift
//  GimmeFood
//
//  Created by Sw2x on 3/25/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit

class ResturantTableViewCell: UITableViewCell {
    
  
    @IBOutlet weak var ResturantName: UIImageView!
    @IBOutlet weak var Name: UILabel!
    
    

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
        ResturantName.image = nil
        Name.text = nil
    }
    
}
