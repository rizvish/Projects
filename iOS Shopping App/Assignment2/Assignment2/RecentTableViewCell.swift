//
//  RecentTableViewCell.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 2/27/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class RecentTableViewCell: UITableViewCell {

    @IBOutlet weak var totalAndCount: UILabel!
    @IBOutlet weak var dateOfOrder: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
