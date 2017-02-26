//
//  ProductsViewController.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 2/25/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView1: UITableView!
  //  var tableView: UITableView!
    
    var productDescription: [String] = []
    var productImage: [UIImage]!
    var productTitle: [String]!
   
    var productPrice: [Double] = [] //segue to cart
    var productType: String! //segue to cart
    var PricePerRow1:[Double] = [] //segue to cart

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
        cell.itemAddButton.addTarget(self, action: #selector(ProductsViewController.addItemButton), for: .touchUpInside)
            return cell
    }
    
    func addItemButton(sender: UIButton)
    {
        let buttonRow = sender.tag
        let buttonRow1 = sender.superview?.superview as! TableViewCell
        
        print("The price of item in ", buttonRow, "is", buttonRow1.itemPrice.text!)
        
        let PricePerRow = Double(buttonRow1.itemPrice.text!)
        
        print(PricePerRow!)
        
        PricePerRow1.append(round(PricePerRow!*1000)/1000)
        //round(1000*currentGPA)/1000
        print("The subTotal is:", PricePerRow1)
        print("Number of items in Cart:", PricePerRow1.count)
        
        let sum = PricePerRow1.reduce(0, +)
        print("Your Total is", sum)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView1.deselectRow(at: indexPath, animated: false)
    }
    
}

class ProductsTableViewCell: UITableViewCell {
    
    var productLabel: UILabel!
    var productTypeLabel: UILabel!
    
    override func awakeFromNib(){
        productLabel = UILabel(frame: CGRect(x: 10, y: frame.height * 0.25, width: 100, height: frame.height/2))
        addSubview(productLabel)
        
        productTypeLabel = UILabel()
        productTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(productTypeLabel)
        let companyRight = productTypeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        let companyCenterY = productTypeLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        NSLayoutConstraint.activate([companyRight, companyCenterY])
        
    }
}
