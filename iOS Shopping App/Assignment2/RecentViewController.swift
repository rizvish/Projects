//
//  RecentViewController.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 2/27/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class RecentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    struct totalAndItems
    {
        var totalAmountOb: Double = 0.0
        var totalItemsOb: Double = 0.0
        var dateAndTimeOb: NSDate? = nil
    }
    @IBOutlet weak var tableView3: UITableView!
    
    var totalAmount: Double = 0.0
    var totalItems: Double = 0.0
    
    var dateAndTime: NSDate? = nil
    
    var totalArray = [totalAndItems]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalArray.append(totalAndItems(totalAmountOb: totalAmount, totalItemsOb: totalItems, dateAndTimeOb: dateAndTime))
        
        tableView3.delegate = self
        tableView3.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView3.dequeueReusableCell(withIdentifier: "recentCell", for: indexPath) as! RecentTableViewCell
   
        cell.totalAndCount.text = "\(totalArray[indexPath.item].totalItemsOb) Items ($\(totalArray[indexPath.item].totalAmountOb))"
        
        cell.dateOfOrder.text = "\(totalArray[indexPath.item].dateAndTimeOb)"
     
        return cell //get rid of warning, delete later
    }
}
