//
//  BalloonViewController.swift
//  Assign3
//
//  Created by Syed Hyder Rizvi on 3/24/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class SortingDifficultyViewController: UIViewController {
    
    var difficulty: String = " "
    
    
    @IBOutlet weak var playGame: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Sorting Game"
        
        let backgroundImg = UIImage(named: "download")
        view.backgroundColor = UIColor(patternImage: backgroundImg!)
        
        playGame?.isHidden = true
        
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
    

    @IBAction func unwindToSorting(segue: UIStoryboardSegue)
    {
        
        
    }
    @IBAction func playSorting(_ sender: Any) {
//        let alert = UIAlertController(title: "\(difficulty) Diffculty", message: "Good Luck!", preferredStyle: UIAlertControllerStyle.alert)
//        
//        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
//        
//        
//        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let sortingDest: SortingViewController = segue.destination as! SortingViewController
        
        sortingDest.difficulty = difficulty
        
    }
 

}
