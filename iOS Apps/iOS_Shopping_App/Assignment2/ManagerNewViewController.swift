//
//  ManagerViewController.swift
//  Assignment2
//
//  Created by Syed Hyder Rizvi on 3/4/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class ManagerNewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoImageView1: UIImageView!
    
    @IBOutlet weak var categoryName: UITextField!
    @IBOutlet weak var itemDescriptionME: UITextField!
    @IBOutlet weak var itemPriceME: UITextField!
    @IBOutlet weak var itemNameME: UITextField!
    
    @IBAction func sendNewItem(_ sender: Any) {
        //        let alert0 = UIAlertController(title: "Sorry", message: "Ran out of time to implement this feature", preferredStyle: .alert)
        //        //alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        //        alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "newToHome", sender: self)
        //        }))
        let alert = UIAlertController(title: "Error", message: "Manager functionality not yet fully implemented.", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func selectImageFromLib(_ sender: UITapGestureRecognizer) {
        
        let imageControllerPicker = UIImagePickerController()
        imageControllerPicker.sourceType = .photoLibrary
        imageControllerPicker.delegate = self
        present(imageControllerPicker, animated: true, completion: nil)
        
    }
    
    @IBAction func selectImageFromLib1(_ sender: UITapGestureRecognizer) {
        
        let imageControllerPicker = UIImagePickerController()
        imageControllerPicker.sourceType = .photoLibrary
        imageControllerPicker.delegate = self
        present(imageControllerPicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedPhoto
        let selectedPhoto1 = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView1.image = selectedPhoto1
        
        //        itemArray.append(itemObject(categoryImage: photoImageView.image!, categoryString: "Hello", productTitleOb: ["Hi"], productImageOb: [photoImageView.image!], productPriceOb: [0.00], productDescriptionOb: ["Hello"]))
        
        
        //  let itemImagePicker = ViewController()
        //  itemImagePicker.myCollectionView.reloadData()
        
        dismiss(animated: true, completion: nil)
    }
    
}
