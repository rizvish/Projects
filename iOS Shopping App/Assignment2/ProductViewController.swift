//
//  ProductsViewController.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 2/25/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var testing: UILabel!
    @IBOutlet weak var numberofItems: UILabel!
    var productDescription: [String] = []
    var productImage: [UIImage]!
    var productTitle: [String]!
    
    @IBOutlet weak var udj: UINavigationItem!
    var productPriceCart: [Double] = []
   
    var productPrice: [Double] = [] //segue to cart
    var productType: String! //segue to cart
    var PricePerRow1:[Double] = [] //segue to cart
    var PricePerRow: Double = 0.0
    var PriceArrayRow: [Double]!
    var sum: Double = 0.0
    
    var PricePerRow3: Double!
    @IBOutlet weak var cartFromCategory: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView1.delegate = self
        tableView1.dataSource = self
        
        self.title = productType
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductsTableViewCell
//        
        let cell = tableView1.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! TableViewCell
        
        cell.itemTitle.text = productTitle[indexPath.row]
        cell.imagesItem.image = productImage[indexPath.row]
        cell.itemPrice.text = String(productPrice[indexPath.row])
        cell.itemDescription.text = productDescription[indexPath.row]
        
        cell.itemAddButton.tag = indexPath.row
        cell.itemAddButton.addTarget(self, action: #selector(ProductViewController.addItemButton), for: .touchUpInside)
         //   PricePerRow1.append(productPrice[indexPath.row])
        productPriceCart = [productPrice[indexPath.row]]
            return cell
        
        
    }
    
    func addItemButton(sender: UIButton)
    {
        let buttonRow = sender.tag
        let buttonRow1 = sender.superview?.superview as! TableViewCell
        
        print("The price of item in ", buttonRow, "is", buttonRow1.itemPrice.text!)
        
    
    //    PricePerRow = Double(buttonRow1.itemPrice.text!)
        
     //  PriceArrayRow.append(2.39)
       // print(PricePerRow)
        
        PricePerRow3 = (Double(buttonRow1.itemPrice.text!))
        print(PricePerRow3)
//        
//      PricePerRow.append(PricePerRow3)

//      print(PricePerRow!)
        
        PricePerRow1.append(round(PricePerRow3!*1000)/1000)

        print("The subTotal is:", PricePerRow1)
        print("Number of items in Cart:", PricePerRow1.count)
    
        sum = PricePerRow1.reduce(0, +)
        print("Your Total is", sum)
        numberofItems.text = String(PricePerRow1.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView1.deselectRow(at: indexPath, animated: false)
    }
    
    @IBAction func didGoToCart(_ sender: Any) {
        self.performSegue(withIdentifier: "toCart", sender: sender)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toCart"
//        {
//            //    let sender = sender as! UIButton
//                let cartVC = segue.destination as! CartViewController
//            print("ProductType aka grocery, appliances, etc:",productType)
//            cartVC.cartSectionName = productType
//            print("productTitle aka apple banana etc", productTitle)
//            cartVC.cartItemForEachSection = productTitle
//            print("priceForEachItem aka self explanatory", PricePerRow1)
//            cartVC.priceForEachItem = PricePerRow1
//            cartVC.totalAmounts = sum
//            cartVC.totalItems = Double(PricePerRow1.count)
//            }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCart"
        {
       //     let sender = sender as! UIButton
          let cartVC = segue.destination as! CartViewController
            
            cartVC.cartSectionName = productType
            print("PRODUCT TYPE", productType)
            
            cartVC.cartItemForEachSection = productTitle
            print("PRODUCT TITLE:", productTitle)
            
            cartVC.priceForEachItem = productPrice
            print("PRODUCT PRICE", productPrice)
            
            print("PRODUCT PRICE CART", productPriceCart)
            cartVC.ArraycountForEachItem = PricePerRow1
            
            
            cartVC.totalAmounts = sum
            cartVC.totalItems1 = Double(PricePerRow1.count)
            
            print("PRICEPERROW", PricePerRow1)
          // cartVC.countForEachItem = PricePerRow
         //   cartVC.ArraycountForEachItem = productPriceCart
          //  cartVC.countForEachItem =
        }
    
    }
}

