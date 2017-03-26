//
//  SortingViewController.swift
//  Assign3
//
//  Created by Syed Hyder Rizvi on 3/24/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit

class SortingViewController: UIViewController {

    var difficulty: String = " "
    
    var images: [UIImage] = [
        UIImage(named: "S1")!,
        UIImage(named: "S2")!
    ]
    
    @IBOutlet weak var difficulty1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        images.shuffle()
        UICall()
    }

    override func viewDidAppear(_ animated: Bool) {
        images.shuffle()
    }
    func UICall()
    {
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.25))
        topView.backgroundColor = UIColor.cyan
        view.addSubview(topView)
        
        let backgroundView = UIImageView(frame: CGRect(x: 0, y: topView.frame.height * 0.9 + 0, width: view.frame.width, height: view.frame.height * 0.90))
        backgroundView.image = #imageLiteral(resourceName: "air-land-water")
        view.addSubview(backgroundView)
        
        switch difficulty {
        case "Easy":
            print("hello")
           let imageView0 = UIImageView(frame: CGRect(x: 10, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.10, height: topView.frame.height * 0.40))
            imageView0.image = images[0]
            topView.addSubview(imageView0)
            
                let imageView1 = UIImageView(frame: CGRect(x: imageView0.frame.width + 30, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.10, height: topView.frame.height * 0.40))
            imageView1.image = images[1]
            topView.addSubview(imageView1)
            
        case "Medium":
            print("heelo")
        case "Hard":
            print("hello")
        default:
            print("default")
        }
    }
}

