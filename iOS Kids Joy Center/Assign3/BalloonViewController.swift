//
//  BalloonViewController.swift
//  Assign3
//
//  Created by Syed Hyder Rizvi on 3/24/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class BalloonViewController: UIViewController {


    @IBOutlet weak var difficultyLabel: UILabel!
    var difficulty: String = " "
    override func viewDidLoad() {
        super.viewDidLoad()
        difficultyLabel.text = "difficulty leve is set to \(difficulty)"
        
        // Do any additional setup after loading the view.
    }
}
