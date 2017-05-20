//
//  TableViewCell.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 2/24/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    /* //FOR Category VC 
    @IBOutlet weak var itemAddButton: UIButton!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var imagesItem: UIImageView!
    */
    

     
//    ONLY FOR CATEGORYITEMS VIEW CONTROLLER
    @IBOutlet weak var imagesItem: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemAddButton: UIButton!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
