//
//  MangerChooseViewController.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 3/4/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class MangerChooseViewController: UIViewController {
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var firstChoice: UILabel!
    
    
    @IBOutlet weak var secondChoice: UILabel!
    @IBOutlet weak var secondButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "background")
        self.view.backgroundColor = UIColor(patternImage: image!)
        
        
        //        firstChoice.text = "Click below to create a new Category"
        //        secondChoice.text = "Click below to create a"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
