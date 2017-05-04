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
//    struct highScores {
//        var scoresStruct: Int = 0
//        var nameOfGameStruct: String = " "
//        var difficultyHighStruct: String = " "
//    }
    
    
    
    var scores: Int = 0
    var nameOfGame: String = " "
    var difficultyHigh: String = " "
    
//    var arrayScoresNames = [highScores]()
    
    var iterator1: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true

        self.navigationItem.title = "HighScores"
        
        
        arrayScoresNames.arraySave.append(arrayScoresNames.highScores(scoresStruct: scores, nameOfGameStruct: nameOfGame, difficultyHighStruct: difficultyHigh))

        tableView.delegate = self
        tableView.dataSource = self
//        
//        UserDefaults.standard.set(arrayScoresNames(), forKey: "myArray")
//        
//        if let x = UserDefaults.standard.object(forKey: "myArray"){
//        
//        print("userdefaults", x)
//        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        arrayScoresNames.arraySave.append(arrayScoresNames.highScores(scoresStruct: scores, nameOfGameStruct: nameOfGame, difficultyHighStruct: difficultyHigh))
  //  tableView.reloadData()
    }
    
    @IBAction func unwindToHighScores(segue: UIStoryboardSegue)
    {
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if arrayScoresNames.arraySave.count < 6{
        return arrayScoresNames.arraySave.count
        }
        else
        {
        arrayScoresNames.arraySave.removeFirst()
        tableView.reloadData()
        return arrayScoresNames.arraySave.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "highscore", for: indexPath) as! HighScoresCellTableViewCell
        
        cell.difficulty.text = arrayScoresNames.arraySave[indexPath.row].difficultyHighStruct
        
        cell.gameType.text = arrayScoresNames.arraySave[indexPath.row].nameOfGameStruct
        
        iterator1 += 1
            
        cell.order.text = String(iterator1)
        
        cell.score.text = String(arrayScoresNames.arraySave[indexPath.row].scoresStruct)
        
        return cell
        
        
    }
    

}
