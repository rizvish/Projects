//
//  ProductsViewController.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 2/25/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit


class ProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // FOR CATEGORITEMS VIEW CONTROLLER
    @IBOutlet weak var tableView1: UITableView!
    
    //@IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var testing: UILabel!
 //   @IBOutlet weak var numberofItems: UILabel!
    
    //FOR CATEGORYITEMS VC
    @IBOutlet weak var numberofItems: UILabel!

    var productDescription: [String] = []
    var productImage: [UIImage]!
    var productTitle: [String] = []
    
    @IBOutlet weak var udj: UINavigationItem!
    var productPriceCart: [Double] = []
   
    var productPrice: [Double] = [] //segue to cart
    var productType: String! //segue to cart
    var PricePerRow1:[Double] = [] //segue to cart
    var PricePerRow: Double = 0.0
    var PriceArrayRow: [Double]!
    var sum: Double = 0.0
    
 //   var productPerRow: [String] = []
    
    var emptyArray: [Double] = []
    
    var PricePerRow3: Double!
    var ProductPricePerRow: String!
    @IBOutlet weak var cartFromCategory: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView1.delegate = self
        tableView1.dataSource = self
        
        self.title = productType
        
        tableView1.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        numberofItems.text = String(ArraycountForEachItemView.count)
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
        
        let cell = tableView1.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! TableViewCell
        
        cell.itemTitle.text = productTitle[indexPath.row]
        cell.imagesItem.image = productImage[indexPath.row]
        cell.itemPrice.text = String(productPrice[indexPath.row])
        cell.itemDescription.text = productDescription[indexPath.row]
        
        cell.itemAddButton.tag = indexPath.row
        cell.itemAddButton.addTarget(self, action: #selector(ProductViewController.addItemButton), for: .touchUpInside)
        productPriceCart = [productPrice[indexPath.row]]
            return cell
    }
    
    func addItemButton(sender: UIButton)
    {
        let buttonRow = sender.tag
        let buttonRow1 = sender.superview?.superview as! TableViewCell
        
        
       ProductPricePerRow = (buttonRow1.itemTitle.text)
        
        
       print("PRODUCTPERROW:", ProductPricePerRow!)

        saveProductType.productArray.append(saveProductType.productStruct(productTypeOb: ProductPricePerRow!))
        
       //  print("PRODUCTPERROW:", saveProductType.productArray)
        
     //   print("PRODUCTPERROW:", saveProductType.productArray[sender.tag].productTypeOb)
        
        producys.append(ProductPricePerRow)
        
      //  print("producys", producys)
        
      //  print("PRODUCTPERROW:", productPerRow1!)
      //  print("The price of item in ", buttonRow, "is", buttonRow1.itemPrice.text!)
        
        PricePerRow3 = (Double(buttonRow1.itemPrice.text!))
      //  print(PricePerRow3)
        
      //  PricePerRow1.append(round(PricePerRow3!*1000)/1000)
        ArraycountForEachItemView.append(round(PricePerRow3!*1000)/1000)

     //   print("The subTotal is:", ArraycountForEachItemView)
      //  print("Number of items in Cart:", ArraycountForEachItemView.count)
    
        sum = ArraycountForEachItemView.reduce(0, +)
      //  print("Your Total is", sum)
        numberofItems.text = String(ArraycountForEachItemView.count)
        
        print("Add ARRAYCOUNTCART", ArraycountForEachItemView)
        print("ProductCartArray", producys)

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView1.deselectRow(at: indexPath, animated: false)
    }
    
    @IBAction func didGoToCart(_ sender: Any) {
        self.performSegue(withIdentifier: "toCart", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCart"
        {
      //    let sender = sender as! UIButton
          let cartVC = segue.destination as! CartViewController
           // cartVC.cartSectionName = producys[sender.tag]
            //cartVC.cartSectionName = productType
            print("PRODUCT TYPE", productType)
            
           cartVC.cartItemForEachSection =  producys
            //cartVC.cartItemForEachSection = productTitle
            print("PRODUCT TITLE:", productTitle)
            
            cartVC.priceForEachItem = productPrice
            print("PRODUCT PRICE", productPrice)
            
          //  cartVC.ArraycountForEachItem = PricePerRow1
            
            print("ARRAYCOUNTSEGUEVIEW", ArraycountForEachItemView)
             cartVC.ArraycountForEachItem = ArraycountForEachItemView

            cartVC.totalAmounts1 = sum
            cartVC.totalItems2 = Double(ArraycountForEachItemView.count)
            
            print("PRICEPERROW", PricePerRow1)
          // cartVC.countForEachItem = PricePerRow
         //   cartVC.ArraycountForEachItem = productPriceCart
          //  cartVC.countForEachItem =
        }
    
    }
    }


