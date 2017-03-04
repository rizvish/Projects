//
//  CartTableViewCell.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 2/26/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

   
    @IBOutlet weak var productLabelText: UILabel!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var increaseProductButton: UIButton!
    @IBOutlet weak var countProductsLabel: UILabel!
    @IBOutlet weak var decreaseProductButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
