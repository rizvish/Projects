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
        UIImage(named: "S2")!, UIImage(named: "S3")!, UIImage(named: "S4")!, UIImage(named: "S5")!, UIImage(named: "SS1")!, UIImage(named: "SS2")!, UIImage(named: "SS3")!, UIImage(named: "SS4")!, UIImage(named: "SS5")!, UIImage(named: "SL1")!, UIImage(named: "SL2")!, UIImage(named: "SL3")!, UIImage(named: "SL4")!, UIImage(named: "SL5")!
    ]
    
    var seconds: Int = 0
    var timerCount = Timer()

    func counter()
    {
        seconds -= 1
        timerLabel.text = String(seconds)
        if(seconds == 0)
        {
            timerCount.invalidate()
        }
    }
    
    @IBOutlet weak var score1: UITextField!
    @IBOutlet weak var timerLabel: UITextField!
    
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
        timerLabel.leftViewMode = UITextFieldViewMode.always
        
        score1.leftViewMode = UITextFieldViewMode.always
        
        
        let image0 = "time"
        let timer = UIImage(named: image0)
        let imageView0 = UIImageView(frame: CGRect(x: 0, y: 0, width: 105, height: 30))
        imageView0.image = timer
        timerLabel.leftView = imageView0

        
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.25))
        topView.backgroundColor = UIColor.cyan
        view.addSubview(topView)
        
        let image1 = "score"
        let score = UIImage(named: image1)
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 105, height: 30))
        imageView1.image = score
        score1.leftView = imageView1
      
//        let backgroundView = UIImageView(frame: CGRect(x: 0, y: topView.frame.height * 0.9 + 0, width: view.frame.width, height: view.frame.height * 0.90))
//        backgroundView.image = #imageLiteral(resourceName: "air-land-water")
//        view.addSubview(backgroundView)
        
        switch difficulty {
        case "Easy":
            print("hello")
            seconds = 120
            timerLabel.text = "\(seconds)"
            timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)

          
            let imageView0 = UIImageView(frame: CGRect(x: 10, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            imageView0.image = images[0]
            topView.addSubview(imageView0)
            
            let imageView1 = UIImageView(frame: CGRect(x: imageView0.frame.width + 30, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            imageView1.image = images[1]
            topView.addSubview(imageView1)
            
            let imageView2 = UIImageView(frame: CGRect(x: imageView0.frame.width + 90, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            imageView2.image = images[2]
            topView.addSubview(imageView2)
            
            let imageView3 = UIImageView(frame: CGRect(x: imageView2.frame.width + 150, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            imageView3.image = images[3]
            topView.addSubview(imageView3)
            
            let imageView4 = UIImageView(frame: CGRect(x: imageView3.frame.width + 210, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            imageView4.image = images[4]
            topView.addSubview(imageView4)
            
            let imageView5 = UIImageView(frame: CGRect(x: imageView4.frame.width + 290, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            imageView5.image = images[5]
            topView.addSubview(imageView5)
            
            let imageView6 = UIImageView(frame: CGRect(x: imageView5.frame.width + 350, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            imageView6.image = images[6]
            topView.addSubview(imageView6)
            
            let imageView7 = UIImageView(frame: CGRect(x: imageView6.frame.width + 410, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            imageView7.image = images[7]
            topView.addSubview(imageView7)
            
        case "Medium":
            print("heelo")
            seconds = 105
            timerLabel.text = "\(seconds)"
          //  timerLabel.leftView = imageView0
            timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)

            
        case "Hard":
            print("hello")
            seconds = 90
            timerLabel.text = "\(seconds)"
        //    timerLabel.leftView = imageView0
            
            timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)
            
        default:
            print("default")
        }
    }
}

