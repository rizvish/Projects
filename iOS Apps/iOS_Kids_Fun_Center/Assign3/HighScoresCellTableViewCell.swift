//
//  HighScoresCellTableViewCell.swift
//  Assign3
//
//  Created by Syed Hyder Rizvi on 3/24/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class HighScoresCellTableViewCell: UITableViewCell {

    @IBOutlet weak var order: UILabel!
    @IBOutlet weak var gameType: UILabel!
    @IBOutlet weak var difficulty: UILabel!
    @IBOutlet weak var score: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
