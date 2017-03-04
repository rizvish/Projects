//
//  CartViewController.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 2/25/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

//var totalAmounts: Double = 0.0
//var totalItems1: Double = 0.0
//var NSdateAndTime = Date()


class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var TotalAmount: UILabel!
    @IBOutlet weak var TotalItems: UILabel!
    @IBOutlet weak var paymentFinal: UIButton!
    
    var productPrice02: Double = 0.0
    
    var cartArray = ["Grocery", "Movies", "Garden"]
    //var cartArray: [String] = []
    
    var cartSectionName: String!
    var cartItemForEachSection: [String]! = []
//  var priceForEachItem: [Double]! = []
    var priceForEachItem: [Double] = []
    var countForEachItem: Double = 0.0
//    var totalAmounts: Double!
//    var totalItems1: Double = 0.0
        var totalAmounts1: Double = 0.0
        var totalItems2: Double = 0.0
//    var NSdateAndTime1: Date? = nil

    var ArraycountForEachItem: [Double]  = []
    
    override func viewDidAppear(_ animated: Bool) {
//        totalAmounts = totalAmounts1
//        totalItems1 = totalItems2
//        NSdateAndTime = NSdateAndTime1
        tableView2.reloadData()

    }

    @IBAction func emptyCart(_ sender: Any)
    
    {
        
        if(ArraycountForEachItem.count != 0)
        {
            priceForEachItem.removeAll()
            print(ArraycountForEachItem)
            ArraycountForEachItemView.removeAll()
            print(ArraycountForEachItem)
      
        let alert0 = UIAlertController(title: "Shopping Cart", message: "Your cart has been emptied", preferredStyle: .alert)
//                 alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "cartToItems", sender: self)
            }))
            
        self.present(alert0, animated: true, completion: nil)
        tableView2.reloadData()

        }
        else
        {
            let alert0 = UIAlertController(title: "Error", message: "Cart has no values", preferredStyle: .alert)
            alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert0, animated: true, completion: nil)
        }
        tableView2.reloadData()
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ARRAYCOUNTCART:::", ArraycountForEachItem)
        print("ArrayProductPrice",ArraycountForEachItem)
        if(!priceForEachItem.isEmpty )
        {
        tableView2.delegate = self
        tableView2.dataSource = self
        
        tableView2.reloadData()
        // Do any additional setup after loading the view.
        }
        else
        {
            let alert0 = UIAlertController(title: "Error", message: "Cart has no values", preferredStyle: .alert)
//            alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{ action in self.performSegue(withIdentifier: "cartToItems", sender: self)
            }))
            self.present(alert0, animated: true, completion: nil)
        }
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItemForEachSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("PRICEFOREachitemmeme:", priceForEachItem)

        
        
        let cell = tableView2.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        if(ArraycountForEachItemView.count != 0){
            
         cell.productLabelText.text = cartItemForEachSection[indexPath.row]
        cell.subTotalLabel?.text = "$ \(String(priceForEachItem[indexPath.row]))"
            print("PRICEFOREachitemmeme:", priceForEachItem)
         cell.countProductsLabel.text = String(priceForEachItem.count)
         TotalAmount.text = String(totalAmounts1)
         TotalItems.text = String(ArraycountForEachItemView.count)
            
        cell.increaseProductButton.tag = indexPath.row
            

        }
        else
        {
            let alert0 = UIAlertController(title: "Error: Go Back or to home", message: "Please add items to cart in order to checkout", preferredStyle: .alert)
//                 alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{ action in self.performSegue(withIdentifier: "cartToItems", sender: self)
            }))
            
                self.present(alert0, animated: true, completion: nil)
        }
    
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRecent"
        {
            let recentVC = segue.destination as! RecentViewController
            recentVC.totalAmount = totalAmounts1
            recentVC.totalItems = totalItems2
            let NSdateAndTime1 = Date()
            recentVC.dateAndTime = NSdateAndTime1
    
            
        }
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView2.deselectRow(at: indexPath, animated: false)
    }
    
    @IBAction func paymentButton(_ sender: Any) {
        
//        let cell = CartTableViewCell()
////      cell.countProductsLabel.text = " "
////      cell.productLabelText.text = " "
//        cell.subTotalLabel?.text = " "

        tableView2.reloadData()
        let alert = UIAlertController(title: "PAYMENT", message: "Your card will be charged $\(round(totalAmounts1*100)/100)", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Pay", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "toRecent", sender: self)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        tableView2.reloadData()

    }
    
}


