//
//  BalloonDifficultyViewController.swift
//  Assign3
//
//  Created by Syed Hyder Rizvi on 3/24/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class BalloonDifficultyViewController: UIViewController {

    var difficulty: String = " "

    @IBOutlet weak var playGame: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Balloon Game"

        let backgroundImg = UIImage(named: "download")
        view.backgroundColor = UIColor(patternImage: backgroundImg!)
        
        playGame?.isHidden = true
        
    }
    @IBAction func unwindToBallon(segue: UIStoryboardSegue)
    {
        
        
    }

    @IBAction func easyBalloon(_ sender: Any) {
        playGame?.isHidden = false
        
        difficulty = "Easy"
        
    }

    @IBAction func mediumBalloon(_ sender: Any) {
        playGame?.isHidden = false
        
        difficulty = "Medium"
    }

    @IBAction func hardBalloon(_ sender: Any) {
        playGame?.isHidden = false
        
        difficulty = "Hard"
    }
    
    @IBAction func playBalloon(_ sender: Any) {
//        let alert = UIAlertController(title: "\(difficulty) Diffculty", message: "Good Luck!", preferredStyle: UIAlertControllerStyle.alert)
//        
//        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
//        
//        
//        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let sortingDest: BalloonViewController = segue.destination as! BalloonViewController
        
        sortingDest.difficulty = difficulty
        
    }


}
