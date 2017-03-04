//
//  ViewController.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 2/22/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

var ArraycountForEachItemView: [Double] = []

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    struct itemObject
    {
        var categoryImage: UIImage
        var categoryString: String!
        
        var productTitleOb: [String]
        var productImageOb: [UIImage]!
        var productPriceOb: [Double]
        var productDescriptionOb: [String]
    }

    var itemArray = [itemObject]()
    
    @IBOutlet weak var myCollectionView: UICollectionView!

    var getGlobal: [Double] = []
    
    var PricePerRow1View: [[Double]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        itemArray.append(itemObject(categoryImage: UIImage(named: "ISrecent")!, categoryString: "Recent Orders", productTitleOb: [" "], productImageOb: [UIImage(named: "ISrecent")!], productPriceOb: [0.00], productDescriptionOb: [" "]))
        
       itemArray.append(itemObject(categoryImage: UIImage(named: "IScart")!, categoryString: "Shopping Cart", productTitleOb: [" "], productImageOb: [UIImage(named: "ISrecent")!], productPriceOb: [0.00], productDescriptionOb: [" "]))
        
         itemArray.append(itemObject(categoryImage: UIImage(named: "ISgrocery")!, categoryString: "Grocery", productTitleOb: ["tomatoes, lb", "bananas, per lb", "Bread", "Broccoli", "Eggs", "Apples", "Gala", "Milk"], productImageOb: [UIImage(named: "G1")!, UIImage(named: "G2")!,UIImage(named: "G3")!, UIImage(named: "G4")!, UIImage(named: "G5")!, UIImage(named: "G6")!, UIImage(named: "G7")!, UIImage(named: "G8")!],productPriceOb: [2.39, 0.59, 3.41, 1.44, 2.39, 0.59, 3.65, 1.44, 2.44, 5.55, 4.21, 1.55], productDescriptionOb: ["Freshly harvested", "Imported from India", "Butter Bread", "Ripe!", "Fresh Eggs", "Red Apples", "100% Organic", "2% Milk"]));
       
        itemArray.append(itemObject(categoryImage: UIImage(named: "ISclothing")!, categoryString: "Clothing", productTitleOb: ["Pants", "Shirts", "Jackets", "Shoes"], productImageOb: [UIImage(named: "C1")!, UIImage(named: "C2")!, UIImage(named: "C3")!, UIImage(named: "C4")!], productPriceOb: [20.99, 15.99, 40.99, 30.99], productDescriptionOb: ["Khaki", "Short Sleeved", "Double Layered", "Sizes 6-14"]));
        
       itemArray.append(itemObject(categoryImage: UIImage(named: "ISmovies")!, categoryString: "Movies", productTitleOb: ["Shawshank Redemption", "The Lord of the Rings", "The Godfather"], productImageOb: [UIImage(named: "M1")!, UIImage(named: "M2")!, UIImage(named: "M3")!], productPriceOb: [15.39, 35.59, 15.47], productDescriptionOb: ["Lowest Price yet", "Box Set", "Includes one movie"]));
        
        itemArray.append(itemObject(categoryImage: UIImage(named: "ISgarden")!, categoryString: "Garden", productTitleOb: ["Shovel", "Plant", "Lawnmower", "Garden Soil", "Orange Tree", "Rake"], productImageOb: [UIImage(named: "GA1")!, UIImage(named: "GA2")!, UIImage(named: "GA3")!, UIImage(named: "GA4")!, UIImage(named: "GA5")!, UIImage(named: "GA6")!], productPriceOb: [15.39, 20.59, 100.46, 25.44, 25.99, 30.29], productDescriptionOb: ["9 inch wide head", "Comes with plant pot", "Fuel not included", "Perfect for gardening", "Well-Rooted", "20 Pronged Rake"]));
        
         itemArray.append(itemObject(categoryImage: UIImage(named: "ISelectronics")!, categoryString: "Electronics", productTitleOb: ["Computer", "GameBoy Advanced", "Laptop", "Camera", "Speakers"], productImageOb: [UIImage(named: "E1")!, UIImage(named: "E2")!, UIImage(named: "E3")!, UIImage(named: "E4")!, UIImage(named: "E5")!], productPriceOb: [899.99, 20.99, 600.99, 240.59, 50.49], productDescriptionOb: ["For all your tech desires", "Classic", "Portable", "High powered Lens", "Surround Sound"]));
        
         itemArray.append(itemObject(categoryImage: UIImage(named: "ISbooks")!, categoryString: "Books", productTitleOb: ["Harry Potter Box Set", "1984", "Algorithm Analysis", "Swift Programming"], productImageOb: [UIImage(named: "B1")!, UIImage(named: "B2")!, UIImage(named: "B3")!, UIImage(named: "B4")!], productPriceOb: [42.55, 14.23, 100.44, 50.45], productDescriptionOb: ["First 6 Harry Potter books", "Profoundly realistic", "Learn about run time & analysis", "Basics of Swift Programming"]));
        
        itemArray.append(itemObject(categoryImage: UIImage(named: "ISappliances")!, categoryString: "Appliances", productTitleOb: ["Washing Machine", "Oven", "Toaster", "Microwave"], productImageOb: [UIImage(named: "A1")!, UIImage(named: "A2")!,UIImage(named: "A3")!,UIImage(named: "A4")!], productPriceOb: [200.39, 150.59, 30.47, 40.44], productDescriptionOb: ["Lightweight", "Oven is amazing", "Toaster toasts", "Microwave microwaves"]));
        
        itemArray.append(itemObject(categoryImage: UIImage(named: "IStoys")!, categoryString: "Toys", productTitleOb: ["Legos", "Puzzles", "Action Figures", "Bey Blades"], productImageOb: [UIImage(named: "T1")!, UIImage(named: "T2")!, UIImage(named: "T3")!, UIImage(named: "T4")!], productPriceOb: [50.99, 10.9, 8.99, 15.99], productDescriptionOb: ["Building blocks", "Challenging", "Fun for all ages", "Battleground for kids"]));

        
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

        if indexPath.row == 0
        {

        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "recentOrders_cells", for: indexPath) as! recentOrdersCollectionViewCell
            
            cell1.recentOrdersButton.setTitle("Recent Orders", for: .normal)
            cell1.recentOrdersImage.image = UIImage(named: "ISrecent")
            
            return cell1
        }
        else if indexPath.row == 1
        {
            
        
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cart_cell", for:indexPath) as! cartCollectionViewCell
            
           cell2.cartButton.setTitle("Shopping Cart", for: .normal)
           cell2.cartImage.image = UIImage(named: "IScart")
        
            return cell2
            
        }
        else
        {
      
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "items_cell", for: indexPath) as! ItemCollectionViewCell

        cell.itemImages.image = itemArray[indexPath.item].categoryImage
        cell.itemButton.setTitle(itemArray[indexPath.item].categoryString, for: .normal)
        
        cell.itemButton.tag = indexPath.item
        cell.itemButton.addTarget(self, action: #selector(ViewController.didGoToProducts), for: .touchUpInside)
        return cell
        
    }
    }
    
    func didGoToProducts(sender: UIButton){
        
        self.performSegue(withIdentifier: "toProduct", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProduct"
        {
            let sender = sender as! UIButton
            let productVC = segue.destination as! ProductViewController
         
            productVC.productTitle = itemArray[sender.tag].productTitleOb
            productVC.productType = itemArray[sender.tag].categoryString
            productVC.productImage = itemArray[sender.tag].productImageOb
            productVC.productPrice = itemArray[sender.tag].productPriceOb
            productVC.productDescription = itemArray[sender.tag].productDescriptionOb
            productVC.PricePerRow1 = getGlobal
        }
}
}
