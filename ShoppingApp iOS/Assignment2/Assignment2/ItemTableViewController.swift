////
////  ItemTableViewController.swift
////  Assignment2
////
////  Created by Syed Hyder Rizvi on 2/24/17.
////  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
////
//
//import UIKit
//
//
//class ItemTableViewController:  UITableViewController {
//    
//    struct itemObject {
//        var itemImageStruct: UIImage
//        var itemTitleStruct: String
//        var itemDescriptionStruct: String
//        var itemPrice: Double
//   //     var itemButton: UIButton
//    }
//    
//    var itemArrayTable: [itemObject] = []
//    var groupTable: [String] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    
//        itemArrayTable.append(itemObject(itemImageStruct: UIImage(named: "tomatoes")!, itemTitleStruct: "Tomatoes, per lb", itemDescriptionStruct: "On the vine", itemPrice: 2.45))
//        groupTable.append("Grocery")
//        groupTable.append("Movies")
//        
//    }
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemArrayTable.count
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        cell.itemPrice.text = String(itemArrayTable[indexPath.row].itemPrice)
//        cell.imagesItem.image = itemArrayTable[indexPath.row].itemImageStruct
//        cell.itemDescription.text = itemArrayTable[indexPath.row].itemDescriptionStruct
//        cell.itemTitle.text = itemArrayTable[indexPath.row].itemTitleStruct
//       
////        cell.itemButton.tag = indexPath.row
////        cell.itemButton.addTarget(self, action: "logAction:", for: .touchUpInside)
//        
//        return cell
//    }
//    
////    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        self.performSegue(withIdentifier: "showView", sender: self)
////    }
//    
////    @IBAction func logAction(sender: UIButton)
////    {
////        itemArrayTable[sender.tag]
////    }
////    
//    
////    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) !as TableViewCell
//////        cell.textLabel?.text = list[indexPath.row]
////        let cell = UITableViewCell(style: //, reuseIdentifier: "cell")
////        cell.
////        return cell
////    }
////    
////    
////    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
////      
////    }
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//}
//
//
//    
