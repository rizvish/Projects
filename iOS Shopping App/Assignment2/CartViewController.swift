//
//  CartViewController.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 2/25/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

var ArraycountForEachItem1: [Double] = []

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var TotalAmount: UILabel!
    @IBOutlet weak var TotalItems: UILabel!
    @IBOutlet weak var paymentFinal: UIButton!
    
    var cartArray = ["Grocery", "Movies", "Garden"]
    //var cartArray: [String] = []
    
    var cartSectionName: String!
    var cartItemForEachSection: [String]! = []
//    var priceForEachItem: [Double]! = []
    var priceForEachItem: [Double]!
    var countForEachItem: Double = 0.0
    var totalAmounts: Double = 0.0
    var totalItems1: Double = 0.0
    var ArraycountForEachItem: [Double]  = []

    
    func setGlobalArray()
    {
        ArraycountForEachItem1 = ArraycountForEachItem
      //  print("HEE", ArraycountForEachItem1)
    }
    
    @IBAction func emptyCart(_ sender: Any) {
            print(ArraycountForEachItem)
            ArraycountForEachItem.removeAll()
            print(ArraycountForEachItem)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGlobalArray()
        
     //  ArraycountForEachItem.append(countForEachItem)
    //  print(countForEachItem)
        print("ArrayProductPrice",ArraycountForEachItem)
        tableView2.delegate = self
        tableView2.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

 //   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Category"
//    }
    
//    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return cartItemForEachSection
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItemForEachSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            
        
        let cell = tableView2.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        if(totalItems1 != 0){
            
        cell.productLabelText.text = cartItemForEachSection[indexPath.row]
        cell.subTotalLabel.text = "$ \(String(priceForEachItem[indexPath.row]))"
        cell.countProductsLabel.text = String(ArraycountForEachItem.count)
        TotalAmount.text = String(totalAmounts)
        TotalItems.text = String(totalItems1)
            
            cell.increaseProductButton.tag = indexPath.row
            
        }
        else
        {
            let alert0 = UIAlertController(title: "Error: Go Back or to home", message: "Please add items to cart in order to checkout", preferredStyle: .alert)
                alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert0, animated: true, completion: nil)
        }
        
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRecent"
        {
            let recentVC = segue.destination as! RecentViewController
            recentVC.totalAmount = totalAmounts
            recentVC.totalItems = totalItems1
            let NSdateAndTime = NSDate()
            recentVC.dateAndTime = NSdateAndTime
            
        }
    }
//        if(totalItems != 0)
//        {
//      //  cell.productLabelText.text = cartItemForEachSection[indexPath.item]
//      //  cell.subTotalLabel.text = String(priceForEachItem)
//            
//            
//        cell.countProductsLabel.text = String(cartItemForEachSection.count)
//            
//        //    cell.countProductsLabel.text = String(priceForEachItem[indexPath.row])
//            
//          //  cell.subTotalLabel.text =
//            
//        cell.increaseProductButton.tag = indexPath.row
//            cell.increaseProductButton.addTarget(self, action: #selector(CartViewController.addItemButtonCart), for: .touchUpInside)
//      
//        TotalAmount.text = String(totalAmounts)
//        TotalItems.text = String(totalItems)
//        }
//        else
//        {
//            let alert0 = UIAlertController(title: "Error: Wrong Calculations", message: "Please add items to cart to checkout", preferredStyle: .alert)
//                alert0.addAction(UIAlertAction(title: "Pay", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "cartError", sender: self)}))
//               self.present(alert0, animated: true, completion: nil)
//        }
//        return cell
    
    
//    func addItemButtonCart (sender: UIButton)
//    {
//        let buttonRow2 = sender.tag
//        let buttonRow3 = sender.superview?.superview as! CartTableViewCell
//      //  PricePerRow2 = Double(buttonRow3)
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView2.deselectRow(at: indexPath, animated: false)
    }
    
    @IBAction func paymentButton(_ sender: Any) {
        let alert = UIAlertController(title: "Payment", message: "Click Pay to pay total amount, or Cancel to edit order", preferredStyle: UIAlertControllerStyle.alert)
        
        //CREATING ON BUTTON
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print ("cancel")
        }))
        
        alert.addAction(UIAlertAction(title: "Pay", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "toRecent", sender: self)
            print("NO")
        }))
        
        self.present(alert, animated: true, completion: nil)

    }
    
}


