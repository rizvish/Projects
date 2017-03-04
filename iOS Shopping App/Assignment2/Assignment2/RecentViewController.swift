//
//  RecentViewController.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 2/27/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit


class RecentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

//    struct totalAndItems
//    {
//        var totalAmountOb: Double = 0.0
//        var totalItemsOb: Double = 0.0
//        var dateAndTimeOb: NSDate? = nil
//    }
//    
//    struct globalRecentStruct
//    {
//        var sumOB: Double = 0.0
//        var itemCountOb: Double = 0.0
//        var dateAndTimeOb: NSDate? = nil
//
//    }
    @IBOutlet weak var tableView3: UITableView!
    
    var sum: Double = 0.0
    var itemCount: Double = 0.0
    
    var totalAmount: Double = 0.0
    var totalItems: Double = 0.0
    
    var anotherMethod: [Double] = [0.0]
    
    var dateAndTime = Date()
 //   var dateAndTime: Date? = nil

    
//    var totalArray = [totalAndItems]()

   // var totalArray1 = [globalRecentStruct]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    saveRecent.totalArray1.sort{$0.dateAndTimeOb! < $1.dateAndTimeOb!}

        tableView3.delegate = self
        tableView3.dataSource = self
        
        
         //totalArray1.append(globalRecentStruct(sumOB: sum, itemCountOb: itemCount))
        
            self.navigationItem.rightBarButtonItem = self.editButtonItem
        
                itemCount = Double(ArraycountForEachItemView.count)
      //  saveRecent.totalArray1.append(globalRecentStruct(sumOB: sum, itemCountOb: itemCount, dateAndTimeOb: dateAndTime))

  //      saveRecent.totalArray1.append(saveRecent.globalRecentStruct(sumOB: sum, itemCountOb: itemCount, dateAndTimeOb: dateAndTime))
                //totalArray.append(totalAndItems(totalAmountOb: totalAmount, totalItemsOb: totalItems, dateAndTimeOb: dateAndTime))
        
        
        sum = ArraycountForEachItemView.reduce(0, +)
        itemCount = Double(ArraycountForEachItemView.count)

        
        saveRecent.totalArray1.append(saveRecent.globalRecentStruct(sumOB: sum, itemCountOb: itemCount, dateAndTimeOb: dateAndTime))
        
       // saveRecent.totalArray1.sort{$0.dateAndTimeOb! > $1.dateAndTimeOb!}

     

    }
    
    override func viewDidAppear(_ animated: Bool) {
      //  saveRecent.totalArray1.sort{$0.dateAndTimeOb! > $1.dateAndTimeOb!}

        if saveRecent.totalArray1.count < 10
        {

            //saveRecent.totalArray1.sort{$0.dateAndTimeOb! > $1.dateAndTimeOb!}
            
        }
        else
        {
            saveRecent.totalArray1.removeLast()
        }
    }

 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("recent Array", ArraycountForEachItemView)
        
        let cell = tableView3.dequeueReusableCell(withIdentifier: "recentCell", for: indexPath) as! RecentTableViewCell
   
            saveRecent.totalArray1.sort{$0.dateAndTimeOb! > $1.dateAndTimeOb!}
            cell.totalAndCount.text = "\(saveRecent.totalArray1[indexPath.item].itemCountOb) Items ($\(saveRecent.totalArray1[indexPath.item].sumOB))"
            
            cell.dateOfOrder?.text = "\(saveRecent.totalArray1[indexPath.item].dateAndTimeOb!)"

        ArraycountForEachItemView.removeAll()

        return cell

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveRecent.totalArray1.count
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView3.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView3.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            saveRecent.totalArray1.remove(at: indexPath.row)
            tableView3.deleteRows(at: [indexPath], with: .fade)
            tableView3.reloadData()

        }
    }
}
