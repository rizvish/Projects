//
//  ViewController.swift
//  Assign3
//
//  Created by Syed Hyder Rizvi on 3/24/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit
//
//enum Difficulty {
//    case Easy, Medium, Hard
//}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImg = UIImage(named: "back-main")
        
         view.backgroundColor = UIColor(patternImage: backgroundImg!)
//        setup()
    }
}

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}
//
//private extension ViewController {
//    func setup() {
//        let backgroundImg = UIImage(named: "back-main")
//        
//        let easyImg = UIImage(named: "easy")
//        let mediumImg = UIImage(named: "medium")
//        let hardImg = UIImage(named: "hard")
//
//        view.backgroundColor = UIColor(patternImage: backgroundImg!)
//        
//        buildButtonWithCenter(center: CGPoint(x: view.center.x,
//                                      y: view.center.y/2.0),
//                              title: "EASY", color: UIColor(patternImage: easyImg!), action: Selector(("onEasyTapped:")))
//        buildButtonWithCenter(center: CGPoint(x: view.center.x,
//                                      y: view.center.y),
//                              title: "MEDIUM", color: UIColor(patternImage: mediumImg!), action: Selector(("onMediumTapped:")))
//        buildButtonWithCenter(center: CGPoint(x: view.center.x,
//                                      y: view.center.y*3.0/2.0),
//                              title: "HARD", color: UIColor(patternImage: hardImg!), action: Selector(("onHardTapped:")))
//}
//    func buildButtonWithCenter(center: CGPoint,
//                               title: String, color: UIColor, action: Selector) {
//        let button = UIButton()
//        button.setTitle(title, for: .normal)
//        button.setTitleColor(UIColor.black,
//                             for: .normal)
//        
//        button.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 50))
//        button.center = center
//        button.backgroundColor = color
//        
//        button.addTarget(self, action: action, for: UIControlEvents.touchUpInside)
//        view.addSubview(button)
//}
//}
//
//extension ViewController {
//    func onEasyTapped(sender: UIButton) {
//        newGameDifficulty(difficulty: .Easy)
//    }
//    
//    func onMediumTapped(sender: UIButton) {
//        newGameDifficulty(difficulty: .Medium)
//    }
//    
//    func onHardTapped(sender: UIButton) {
//        newGameDifficulty(difficulty: .Hard)
//    }
//    
//    func newGameDifficulty(difficulty: Difficulty) {
//        switch difficulty {
//        case .Easy:
//            print("Easy\n")
//        case .Medium:
//            print("Medium\n")
//        case .Hard:
//            print("Hard\n")
//        }
//    }
//    
