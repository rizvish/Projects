//
//  MemoryDifficultyViewController.swift
//  Assign3
//
//  Created by Syed Hyder Rizvi on 3/24/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class MemoryDifficultyViewController: UIViewController {
    
    var difficulty: String = " "

    @IBOutlet weak var playGame: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Memory Game"

        
        let backgroundImg = UIImage(named: "download")
        view.backgroundColor = UIColor(patternImage: backgroundImg!)
        
        playGame?.isHidden = true
        
    }

    @IBAction func unwindToMemory(segue: UIStoryboardSegue)
    {
        
        
    }

    @IBAction func easyMemory(_ sender: Any) {
        playGame?.isHidden = false
        
        difficulty = "Easy"
    }
   
    
    @IBAction func mediumMemory(_ sender: Any) {
        playGame?.isHidden = false
        
        difficulty = "Medium"
    }
    
    @IBAction func hardMemory(_ sender: Any) {
        playGame?.isHidden = false
        
        difficulty = "Hard"
    }
    @IBAction func playMemory(_ sender: Any) {
        
//        let alert = UIAlertController(title: "\(difficulty) Diffculty", message: "Good Luck!", preferredStyle: UIAlertControllerStyle.alert)
//        
//        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
//        
//        
//        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let sortingDest: MemoryViewController = segue.destination as! MemoryViewController
        
        sortingDest.difficulty = difficulty
        
    }

}
