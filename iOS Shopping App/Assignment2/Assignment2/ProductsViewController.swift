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
    
    var productImage: [UIImage]!
    var productTitle: [String]!
    var productPrice: [Double] = []
    var productType: String!
    var productDescription: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
//        view.addSubview(tableView)
//        
//        tableView.delegate = self
//        tableView.dataSource = self
        
        tableView1.delegate = self
        tableView1.dataSource = self

        
//        tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: "productCell")
        
//        tableView1.register(TableViewCell.self, forCellReuseIdentifier: "productCell")
        
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
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
////        let cell = cell as! ProductsTableViewCell
////        cell.productLabel.text = productTitle[indexPath.row]
////        cell.productTypeLabel.text = productType
//        
//        let cell = cell as! TableViewCell
//        
//       cell.itemTitle.text = productTitle[indexPath.row]
//        cell.itemDescription.text = productType
//    }
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
