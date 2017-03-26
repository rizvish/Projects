//
//  HighScoresViewController.swift
//  Assign3
//
//  Created by Syed Hyder Rizvi on 3/24/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class HighScoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var iterator1: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "highscore", for: indexPath) as! HighScoresCellTableViewCell
        
        cell.difficulty.text = "Hard"
        cell.gameType.text = "Sorting"
        
        iterator1 += 1
            
        cell.order.text = String(iterator1)
        
        cell.score.text = "40"
        
        
        return cell
        
        
    }

}
