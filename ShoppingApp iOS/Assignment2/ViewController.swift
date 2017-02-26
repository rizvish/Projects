//
//  ViewController.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 2/22/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    struct itemObject
    {
        var categoryImage: UIImage
        var categoryString: String
        var productTitleOb: [String]
        var productImageOb: [UIImage]!
        var productPriceOb: [Double]
        var productDescriptionOb: [String]
    }
    
    
    var itemArray = [itemObject]()
    
    @IBOutlet weak var backgroundOutlet: UIImageView!
    @IBOutlet weak var myCollectionView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()
//        recentArray.append(recentObject(recentOrdersImage: UIImage(named: "ISrecent")!, recentOrdersString: "Recent Orders"))
//        
//        cartArray.append(cartObject(cartImage: UIImage(named: "IScart")!, cartString: "Cart"))
//      
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
//        itemArray.append(itemObject(categoryImage: UIImage(named: "ISrecent")!, categoryString: "Recent Orders", productTitleOb: ["tomatoes, lb", "bananas, per lb", "Bread", "Broccoli", "Eggs", "Apples", "Gala", "Milk"], productImageOb: [UIImage(named: "G1")!, UIImage(named: "G2")!,UIImage(named: "G3")!, UIImage(named: "G4")!, UIImage(named: "G5")!, UIImage(named: "G6")!, UIImage(named: "G7")!, UIImage(named: "G8")!],productPriceOb: [2.39, 0.59, 3.40, 1.44, 2.39, 0.59, 3.40, 1.44], productDescriptionOb: ["Awesome!", "Great!", "WabbaWabba!", "Awesome!", "Great!", "WabbaWabba!", "Yay", "Fatty"]));
//       
//        //["$2.39", "$0.59", "$3.40", "$1.44","$2.39", "$0.59", "$3.40", "$1.44"]
//        
//        itemArray.append(itemObject(categoryImage: UIImage(named: "IScart")!, categoryString: "Cart", productTitleOb: ["tomatoes", "bananas", "Apples"], productImageOb: [UIImage(named: "G1")!, UIImage(named: "G2")!, UIImage(named: "G3")!], productPriceOb: [2.39, 0.59, 3.40, 1.44, 2.39, 0.59, 3.40, 1.44], productDescriptionOb: ["Awesome!", "Great!", "WabbaWabba!", "Awesome!", "Great!", "WabbaWabba!", "Yay"]));
      
        itemArray.append(itemObject(categoryImage: UIImage(named: "ISgrocery")!, categoryString: "Grocery", productTitleOb: ["tomatoes, lb", "bananas, per lb", "Bread", "Broccoli", "Eggs", "Apples", "Gala", "Milk"], productImageOb: [UIImage(named: "G1")!, UIImage(named: "G2")!,UIImage(named: "G3")!, UIImage(named: "G4")!, UIImage(named: "G5")!, UIImage(named: "G6")!, UIImage(named: "G7")!, UIImage(named: "G8")!],productPriceOb: [2.39, 0.59, 3.40, 1.44, 2.39, 0.59, 3.40, 1.44, 2.44, 5.55, 4.21, 1.55], productDescriptionOb: ["Wow", "Great", "Amazing", "Fantastic", "Awesome", "WabbaWabba!", "Dirk", "WOW will this work?"]));
        
        itemArray.append(itemObject(categoryImage: UIImage(named: "ISclothing")!, categoryString: "Clothing", productTitleOb: ["tomatoes, 3lbs", "bananas, per lb"], productImageOb: [UIImage(named: "G1")!, UIImage(named: "G2")!], productPriceOb: [2.39, 0.59, 3.40, 1.44, 2.39, 0.59, 3.40, 1.44], productDescriptionOb: ["Awesome!", "Great!", "WabbaWabba!", "Awesome!", "Great!", "WabbaWabba!", "Yay"]));
        
        itemArray.append(itemObject(categoryImage: UIImage(named: "ISmovies")!, categoryString: "Movies", productTitleOb: ["Shawshank Redemption", "The Lord of the Rings", "The Godfather"], productImageOb: [UIImage(named: "M1")!, UIImage(named: "M2")!, UIImage(named: "M3")!], productPriceOb: [15.30, 35.59, 15.40], productDescriptionOb: ["Awesome!", "Great!", "WabbaWabba!", "Yay"]));
        
        itemArray.append(itemObject(categoryImage: UIImage(named: "ISgarden")!, categoryString: "Garden", productTitleOb: ["Shovel", "Plant (pot included)", "Lawnmower", "Garden Soil", "Orange Tree", "Rake"], productImageOb: [UIImage(named: "GA1")!, UIImage(named: "GA2")!, UIImage(named: "GA3")!, UIImage(named: "GA4")!, UIImage(named: "GA5")!, UIImage(named: "GA6")!], productPriceOb: [15.39, 20.59, 100.40, 25.44, 25.00, 30.29], productDescriptionOb: ["Awesome!", "Great!", "WabbaWabba!", "Awesome!", "Great!", "WabbaWabba!", "Yay"]));
        
        itemArray.append(itemObject(categoryImage: UIImage(named: "ISelectronics")!, categoryString: "Electronics", productTitleOb: ["tomatoes, 3lbs", "bananas, per lb"], productImageOb: [UIImage(named: "G1")!, UIImage(named: "G2")!], productPriceOb: [2.39, 0.59, 3.40, 1.44, 2.39, 0.59, 3.40, 1.44], productDescriptionOb: ["Awesome!", "Great!", "WabbaWabba!", "Awesome!", "Great!", "WabbaWabba!", "Yay"]));
        
        itemArray.append(itemObject(categoryImage: UIImage(named: "ISbooks")!, categoryString: "Books", productTitleOb: ["tomatoes, 3lbs", "bananas, per lb"], productImageOb: [UIImage(named: "G1")!, UIImage(named: "G2")!], productPriceOb: [2.39, 0.59, 3.40, 1.44, 2.39, 0.59, 3.40, 1.44], productDescriptionOb: ["Awesome!", "Great!", "WabbaWabba!", "Awesome!", "Great!", "WabbaWabba!", "Yay"]));
        
        itemArray.append(itemObject(categoryImage: UIImage(named: "ISappliances")!, categoryString: "Appliances", productTitleOb: ["tomatoes, 3lbs", "bananas, per lb"], productImageOb: [UIImage(named: "G1")!, UIImage(named: "G2")!], productPriceOb: [2.39, 0.59, 3.40, 1.44, 2.39, 0.59, 3.40, 1.44], productDescriptionOb: ["Awesome!", "Great!", "WabbaWabba!", "Awesome!", "Great!", "WabbaWabba!", "Yay"]));
        
        itemArray.append(itemObject(categoryImage: UIImage(named: "IStoys")!, categoryString: "Toys", productTitleOb: ["tomatoes, 3lbs", "bananas, per lb"], productImageOb: [UIImage(named: "G1")!, UIImage(named: "G2")!], productPriceOb: [2.39, 0.59, 3.40, 1.44, 2.39, 0.59, 3.40, 1.44], productDescriptionOb: ["Awesome!", "Great!", "WabbaWabba!", "Awesome!", "Great!", "WabbaWabba!", "Yay"]));

        
        let backgroundIMG = "topBackground"
        self.myCollectionView.backgroundColor = UIColor(patternImage: UIImage(named: backgroundIMG)!);
        
        
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "items_cell", for: indexPath) as! ItemCollectionViewCell
        
//        cell.itemImages.image = recentArray[indexPath.item].recentOrdersImage
//        cell.itemButton.setTitle(recentArray[indexPath.item].recentOrdersString, for: .normal)
//        
//        cell.itemImages.image = cartArray[indexPath.item].cartImage
//        cell.itemButton.setTitle(cartArray[indexPath.item].cartString, for: .normal)
        
        cell.itemImages.image = itemArray[indexPath.item].categoryImage
        cell.itemButton.setTitle(itemArray[indexPath.item].categoryString, for: .normal)
        
        cell.itemButton.tag = indexPath.item
        cell.itemButton.addTarget(self, action: #selector(didGoToProducts), for: .touchUpInside)
        
        return cell;
        }
    
    func didGoToProducts(sender: UIButton){
        
        self.performSegue(withIdentifier: "toProducts", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProducts"
        {
            let sender = sender as! UIButton
            let productVC = segue.destination as! ProductsViewController
         
            productVC.productTitle = itemArray[sender.tag].productTitleOb
            productVC.productType = itemArray[sender.tag].categoryString
            productVC.productImage = itemArray[sender.tag].productImageOb
            productVC.productPrice = itemArray[sender.tag].productPriceOb
            productVC.productDescription = itemArray[sender.tag].productDescriptionOb
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
