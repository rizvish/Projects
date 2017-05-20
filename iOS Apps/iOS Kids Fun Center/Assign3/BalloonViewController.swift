//
//  BalloonViewController.swift
//  Assign3
//
//  Created by Syed Hyder Rizvi on 3/24/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import AVFoundation
import UIKit

class BalloonViewController: UIViewController {
    
    @IBOutlet weak var testingImage: UIImageView!
    
    var textFieldTimer: UITextField! = nil
    var textFieldScore: UITextField! = nil

    
    var difficulty: String = " "
    var score1: Int = 0
    var seconds: Int = 0
    var timerCount = Timer()
    var audioPlayer = AVAudioPlayer()
    var arrayNumbersDelay : [Double] = [8.0, 12.5, 4.6, 0.1, 13.3, 6.0, 2.0]
    
    var arrayNumberSpeedEasy : [Int] = [14, 15, 13, 16, 12, 18, 17]
    var arrayNumberSpeedMedium : [Int] = [9, 11, 12, 8, 13, 10]
    var arrayNumberSpeedHard : [Int] = [6, 5, 4, 3]
    
    struct easyBalloonVariables{
        
        var easyBalloonImage: UIImage
        var easyBalloonNumber: UIImage
    }
    
    struct mediumBalloonVariables {
        var mediumballoonImage: UIImage
        var mediumballoonNumber: UIImage
    }
    struct hardBalloonVariables{
        
        var hardBalloonImage: UIImage
        var hardBalloonNumber: UIImage
    }

    var easyArrayBalloon = [easyBalloonVariables]()
    var mediumArrayBalloon = [mediumBalloonVariables]()
    var hardArrayBalloon = [hardBalloonVariables]()

    var easyBalloon1: UIImageView? = nil
    var easyNumber1: UIImageView? = nil
    var easyBalloon2: UIImageView? = nil
    var easyNumber2: UIImageView? = nil
    var easyBalloon3: UIImageView? = nil
    var easyNumber3: UIImageView? = nil
    var easyBalloon4: UIImageView? = nil
    var easyNumber4: UIImageView? = nil
    var easyBalloon5: UIImageView? = nil
    var easyNumber5: UIImageView? = nil
    var easyBalloon6: UIImageView? = nil
    var easyNumber6: UIImageView? = nil
    var easyBalloon7: UIImageView? = nil
    var easyNumber7: UIImageView? = nil
    var easyBalloon8: UIImageView? = nil
    var easyNumber8: UIImageView? = nil
    var easyBalloon9: UIImageView? = nil
    var easyNumber9: UIImageView? = nil
    var easyBalloon10: UIImageView? = nil
    var easyNumber10: UIImageView? = nil
    
    var mediumBalloon1: UIImageView? = nil
    var mediumNumber1: UIImageView? = nil
    var mediumBalloon2: UIImageView? = nil
    var mediumNumber2: UIImageView? = nil
    var mediumBalloon3: UIImageView? = nil
    var mediumNumber3: UIImageView? = nil
    var mediumBalloon4: UIImageView? = nil
    var mediumNumber4: UIImageView? = nil
    var mediumBalloon5: UIImageView? = nil
    var mediumNumber5: UIImageView? = nil
    var mediumBalloon6: UIImageView? = nil
    var mediumNumber6: UIImageView? = nil
    var mediumBalloon7: UIImageView? = nil
    var mediumNumber7: UIImageView? = nil
    var mediumBalloon8: UIImageView? = nil
    var mediumNumber8: UIImageView? = nil
    var mediumBalloon9: UIImageView? = nil
    var mediumNumber9: UIImageView? = nil
    var mediumBalloon10: UIImageView? = nil
    var mediumNumber10: UIImageView? = nil

    var hardBalloon1: UIImageView? = nil
    var hardNumber1: UIImageView? = nil
    var hardBalloon2: UIImageView? = nil
    var hardNumber2: UIImageView? = nil
    var hardBalloon3: UIImageView? = nil
    var hardNumber3: UIImageView? = nil
    var hardBalloon4: UIImageView? = nil
    var hardNumber4: UIImageView? = nil
    var hardBalloon5: UIImageView? = nil
    var hardNumber5: UIImageView? = nil
    var hardBalloon6: UIImageView? = nil
    var hardNumber6: UIImageView? = nil
    var hardBalloon7: UIImageView? = nil
    var hardNumber7: UIImageView? = nil
    var hardBalloon8: UIImageView? = nil
    var hardNumber8: UIImageView? = nil
    var hardBalloon9: UIImageView? = nil
    var hardNumber9: UIImageView? = nil
    var hardBalloon10: UIImageView? = nil
    var hardNumber10: UIImageView? = nil

    
  //  var testingImage: UIImageView? = nil
    
    @IBAction func unwindFromBalloon(_ sender: Any) {
        timerCount.invalidate()
        self.performSegue(withIdentifier: "unwindVC", sender: self)
    }
    
    func tappedMe()
    {
        print("Tapped on Image")
    //    testingImage?.removeFromSuperview()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Balloon Game"
        
        let imageView0 = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        imageView0.image = #imageLiteral(resourceName: "balloonBackground")
        view.addSubview(imageView0)
        
        let indicator = UILabel(frame: CGRect(x: view.center.y, y: 5, width: view.frame.width, height: view.frame.height * 0.25))
        
        indicator.highlightedTextColor = UIColor.black
        indicator.text = "click here to pop balloons"
        indicator.font = UIFont(name: "Farah", size: 15.0)


        view.addSubview(indicator)
        
//        testingImage = UIImageView(frame: CGRect(x: 200, y: view.frame.height * 0.25, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
//        testingImage?.image = UIImage(named: "easy")
       // self.view.addSubview(testingImage!)
        
//         let tap = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.tappedMe))
//        
//        testingImage?.isUserInteractionEnabled = true
//
//        self.testingImage?.addGestureRecognizer(tap)
//
//        
//            UIView.animate(withDuration: TimeInterval(5), delay: arrayNumbersDelay[0], options: [.allowUserInteraction, .repeat], animations: {
//                self.testingImage?.addGestureRecognizer(tap)
//
//            self.testingImage?.frame.origin.y = 0
//
//        }, completion:{_ in self.easyUI()})
        
    
      //  testingImage?.addGestureRecognizer(tap)
      
        do{
            let audio = Bundle.main.path(forResource: "2", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio!))
        }
        catch
        {
            print("something to do with audio error")
        }
        
//        setBalloonUI()
        
        setBalloonSecondaries()
        
        switch difficulty {
        case "Easy":
            easyArrayBalloon.append(easyBalloonVariables(easyBalloonImage: UIImage(named: "color1")!, easyBalloonNumber: UIImage(named: "num0")!))
            easyArrayBalloon.append(easyBalloonVariables(easyBalloonImage: UIImage(named: "color2")!, easyBalloonNumber: UIImage(named: "num1")!))
            easyArrayBalloon.append(easyBalloonVariables(easyBalloonImage: UIImage(named: "color3")!, easyBalloonNumber: UIImage(named: "num2")!))
            easyArrayBalloon.append(easyBalloonVariables(easyBalloonImage: UIImage(named: "color4")!, easyBalloonNumber: UIImage(named: "num3")!))
            easyArrayBalloon.append(easyBalloonVariables(easyBalloonImage: UIImage(named: "color5")!, easyBalloonNumber: UIImage(named: "num4")!))
            easyArrayBalloon.append(easyBalloonVariables(easyBalloonImage: UIImage(named: "color6")!, easyBalloonNumber: UIImage(named: "num5")!))
            easyArrayBalloon.append(easyBalloonVariables(easyBalloonImage: UIImage(named: "color7")!, easyBalloonNumber: UIImage(named: "num6")!))
            easyArrayBalloon.append(easyBalloonVariables(easyBalloonImage: UIImage(named: "color8")!, easyBalloonNumber: UIImage(named: "num7")!))
            easyArrayBalloon.append(easyBalloonVariables(easyBalloonImage: UIImage(named: "color9")!, easyBalloonNumber: UIImage(named: "num8")!))
            easyArrayBalloon.append(easyBalloonVariables(easyBalloonImage: UIImage(named: "color10")!, easyBalloonNumber: UIImage(named: "num9")!))
            setEasyBalloonUI()
            setEasyBalloonUI1()
            setEasyBalloonUI2()
            setEasyBalloonUI3()
            setEasyBalloonUI4()
            setEasyBalloonUI5()
            setEasyBalloonUI6()
            setEasyBalloonUI7()
            setEasyBalloonUI8()
            setEasyBalloonUI9()

        case "Medium":
            mediumArrayBalloon.append(mediumBalloonVariables(mediumballoonImage: UIImage(named: "color1")!, mediumballoonNumber: UIImage(named: "num1")!))
            mediumArrayBalloon.append(mediumBalloonVariables(mediumballoonImage: UIImage(named: "color2")!, mediumballoonNumber: UIImage(named: "num2")!))
            mediumArrayBalloon.append(mediumBalloonVariables(mediumballoonImage: UIImage(named: "color3")!, mediumballoonNumber: UIImage(named: "num3")!))
            mediumArrayBalloon.append(mediumBalloonVariables(mediumballoonImage: UIImage(named: "color4")!, mediumballoonNumber: UIImage(named: "num4")!))
            mediumArrayBalloon.append(mediumBalloonVariables(mediumballoonImage: UIImage(named: "color5")!, mediumballoonNumber: UIImage(named: "num5")!))
            mediumArrayBalloon.append(mediumBalloonVariables(mediumballoonImage: UIImage(named: "color6")!, mediumballoonNumber: UIImage(named: "num6")!))
            mediumArrayBalloon.append(mediumBalloonVariables(mediumballoonImage: UIImage(named: "color7")!, mediumballoonNumber: UIImage(named: "num7")!))
            mediumArrayBalloon.append(mediumBalloonVariables(mediumballoonImage: UIImage(named: "color8")!, mediumballoonNumber: UIImage(named: "num1")!))
            mediumArrayBalloon.append(mediumBalloonVariables(mediumballoonImage: UIImage(named: "color9")!, mediumballoonNumber: UIImage(named: "num2")!))
            mediumArrayBalloon.append(mediumBalloonVariables(mediumballoonImage: UIImage(named: "color10")!, mediumballoonNumber: UIImage(named: "num3")!))
            setMediumBalloonUI()
            setMediumBalloonUI1()
            setMediumBalloonUI2()
            setMediumBalloonUI3()
            setMediumBalloonUI4()
            setMediumBalloonUI5()
            setMediumBalloonUI6()
            setMediumBalloonUI7()
            setMediumBalloonUI8()
            setMediumBalloonUI9()

        case "Hard":
            hardArrayBalloon.append(hardBalloonVariables(hardBalloonImage: UIImage(named: "color1")!, hardBalloonNumber: UIImage(named: "num1")!))
            hardArrayBalloon.append(hardBalloonVariables(hardBalloonImage: UIImage(named: "color2")!, hardBalloonNumber: UIImage(named: "num2")!))
            hardArrayBalloon.append(hardBalloonVariables(hardBalloonImage: UIImage(named: "color3")!, hardBalloonNumber: UIImage(named: "num3")!))
            hardArrayBalloon.append(hardBalloonVariables(hardBalloonImage: UIImage(named: "color4")!, hardBalloonNumber: UIImage(named: "num4")!))
            hardArrayBalloon.append(hardBalloonVariables(hardBalloonImage: UIImage(named: "color5")!, hardBalloonNumber: UIImage(named: "num5")!))
            hardArrayBalloon.append(hardBalloonVariables(hardBalloonImage: UIImage(named: "color6")!, hardBalloonNumber: UIImage(named: "num1")!))
            hardArrayBalloon.append(hardBalloonVariables(hardBalloonImage: UIImage(named: "color7")!, hardBalloonNumber: UIImage(named: "num2")!))
            hardArrayBalloon.append(hardBalloonVariables(hardBalloonImage: UIImage(named: "color8")!, hardBalloonNumber: UIImage(named: "num3")!))
            hardArrayBalloon.append(hardBalloonVariables(hardBalloonImage: UIImage(named: "color9")!, hardBalloonNumber: UIImage(named: "num4")!))
            hardArrayBalloon.append(hardBalloonVariables(hardBalloonImage: UIImage(named: "color10")!, hardBalloonNumber: UIImage(named: "num5")!))
            setHardBalloonUI()
            setHardBalloonUI1()
            setHardBalloonUI2()
            setHardBalloonUI3()
            setHardBalloonUI4()
            setHardBalloonUI5()
            setHardBalloonUI6()
            setHardBalloonUI7()
            setHardBalloonUI8()
            setHardBalloonUI9()
       
        default:
            print("default")
        }
    }
    
    func setHardBalloonUI()
    {
        self.hardBalloon1?.removeFromSuperview()
        self.hardNumber1?.removeFromSuperview()
        
        if seconds != 0
        {
            hardArrayBalloon.shuffle()
            arrayNumberSpeedHard.shuffle()
            arrayNumbersDelay.shuffle()
            
            hardBalloon1 = UIImageView(frame: CGRect(x: 0, y: view.frame.height, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(hardBalloon1!)
            
            hardNumber1 = UIImageView(frame: CGRect(x: (hardBalloon1?.center.x)! - 5, y: (hardBalloon1?.center.y)!, width: (hardBalloon1?.frame.width)! * 0.30, height: (hardBalloon1?.frame.height)! * 0.30))
            self.view.addSubview(hardNumber1!)
            
            hardBalloon1?.image = hardArrayBalloon[0].hardBalloonImage
            hardNumber1?.image = hardArrayBalloon[0].hardBalloonNumber
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.hardRemove))
            
            hardBalloon1?.isUserInteractionEnabled = true
            hardNumber1?.isUserInteractionEnabled = true
            
            self.hardNumber1?.addGestureRecognizer(tap1)
            self.hardBalloon1?.addGestureRecognizer(tap1)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedHard[1]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {

                self.hardBalloon1?.frame.origin.y = 0
                self.hardNumber1?.frame.origin.y = 0
                
                
            }, completion:{_ in self.setHardBalloonUI() } )
        }
        else
        {
            timerCount.invalidate()
            hardBalloon1?.removeFromSuperview()
            hardNumber1?.removeFromSuperview()
        }
    }

    func hardRemove()
    {
        self.hardBalloon1?.removeFromSuperview()
        self.hardNumber1?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    
    func setHardBalloonUI1()
    {
        self.hardBalloon2?.removeFromSuperview()
        self.hardNumber2?.removeFromSuperview()
        
        if seconds != 0
        {
            hardArrayBalloon.shuffle()
            arrayNumberSpeedHard.shuffle()
            arrayNumbersDelay.shuffle()
            
            hardBalloon2 = UIImageView(frame: CGRect(x: 45, y: view.frame.height, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(hardBalloon2!)
            
            hardNumber2 = UIImageView(frame: CGRect(x: (hardBalloon2?.center.x)! - 5, y: (hardBalloon2?.center.y)!, width: (hardBalloon2?.frame.width)! * 0.30, height: (hardBalloon2?.frame.height)! * 0.30))
            self.view.addSubview(hardNumber2!)
            
            hardBalloon2?.image = hardArrayBalloon[1].hardBalloonImage
            hardNumber2?.image = hardArrayBalloon[1].hardBalloonNumber
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.hardRemove1))
            
            hardBalloon2?.isUserInteractionEnabled = true
            hardNumber2?.isUserInteractionEnabled = true
            
            self.hardNumber2?.addGestureRecognizer(tap1)
            self.hardBalloon2?.addGestureRecognizer(tap1)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedHard[2]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {
       
                self.hardBalloon2?.frame.origin.y = 0
                self.hardNumber2?.frame.origin.y = 0
                
                
            }, completion:{_ in self.setHardBalloonUI1() } )
        }
        else
        {
            timerCount.invalidate()
            hardBalloon2?.removeFromSuperview()
            hardNumber2?.removeFromSuperview()
        }
    }
    func hardRemove1()
    {
        self.hardBalloon2?.removeFromSuperview()
        self.hardNumber2?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setHardBalloonUI2()
    {
        self.hardBalloon3?.removeFromSuperview()
        self.hardNumber3?.removeFromSuperview()
        
        if seconds != 0
        {
            hardArrayBalloon.shuffle()
            arrayNumberSpeedHard.shuffle()
            arrayNumbersDelay.shuffle()
            
            hardBalloon3 = UIImageView(frame: CGRect(x: 90, y: view.frame.height, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(hardBalloon3!)
            
            hardNumber3 = UIImageView(frame: CGRect(x: (hardBalloon3?.center.x)! - 5, y: (hardBalloon3?.center.y)!, width: (hardBalloon3?.frame.width)! * 0.30, height: (hardBalloon3?.frame.height)! * 0.30))
            self.view.addSubview(hardNumber3!)
            
            hardBalloon3?.image = hardArrayBalloon[2].hardBalloonImage
            hardNumber3?.image = hardArrayBalloon[2].hardBalloonNumber
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.hardRemove2))
            
            hardBalloon3?.isUserInteractionEnabled = true
            hardNumber3?.isUserInteractionEnabled = true
            
            self.hardNumber3?.addGestureRecognizer(tap1)
            self.hardBalloon3?.addGestureRecognizer(tap1)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedHard[3]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {
                
                self.hardBalloon3?.frame.origin.y = 0
                self.hardNumber3?.frame.origin.y = 0
                
                
            }, completion:{_ in self.setHardBalloonUI2() } )
        }
        else
        {
            timerCount.invalidate()
            hardBalloon3?.removeFromSuperview()
            hardNumber3?.removeFromSuperview()
    }
    }
    func hardRemove2()
    {
        self.hardBalloon3?.removeFromSuperview()
        self.hardNumber3?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setHardBalloonUI3()
    {
        self.hardBalloon4?.removeFromSuperview()
        self.hardNumber4?.removeFromSuperview()
        
        if seconds != 0
        {
            hardArrayBalloon.shuffle()
            arrayNumberSpeedHard.shuffle()
            arrayNumbersDelay.shuffle()
            
            hardBalloon4 = UIImageView(frame: CGRect(x: 135, y: view.frame.height, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(hardBalloon4!)
            
            hardNumber4 = UIImageView(frame: CGRect(x: (hardBalloon4?.center.x)! - 5, y: (hardBalloon4?.center.y)!, width: (hardBalloon4?.frame.width)! * 0.30, height: (hardBalloon4?.frame.height)! * 0.30))
            self.view.addSubview(hardNumber4!)
            
            hardBalloon4?.image = hardArrayBalloon[3].hardBalloonImage
            hardNumber4?.image = hardArrayBalloon[3].hardBalloonNumber
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.hardRemove3))
            
            hardBalloon4?.isUserInteractionEnabled = true
            hardNumber4?.isUserInteractionEnabled = true
            
            self.hardNumber4?.addGestureRecognizer(tap1)
            self.hardBalloon4?.addGestureRecognizer(tap1)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedHard[3]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {
                
                self.hardBalloon4?.frame.origin.y = 0
                self.hardNumber4?.frame.origin.y = 0
                
                
            }, completion:{_ in self.setHardBalloonUI3() } )
        }
        else
        {
            timerCount.invalidate()
            hardBalloon4?.removeFromSuperview()
            hardNumber4?.removeFromSuperview()
        }

    }
    func hardRemove3()
    {
        self.hardBalloon4?.removeFromSuperview()
        self.hardNumber4?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setHardBalloonUI4()
    {
        self.hardBalloon5?.removeFromSuperview()
        self.hardNumber5?.removeFromSuperview()
        
        if seconds != 0
        {
            hardArrayBalloon.shuffle()
            arrayNumberSpeedHard.shuffle()
            arrayNumbersDelay.shuffle()
            
            hardBalloon5 = UIImageView(frame: CGRect(x: 180, y: view.frame.height, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(hardBalloon5!)
            
            hardNumber5 = UIImageView(frame: CGRect(x: (hardBalloon5?.center.x)! - 5, y: (hardBalloon5?.center.y)!, width: (hardBalloon5?.frame.width)! * 0.30, height: (hardBalloon5?.frame.height)! * 0.30))
            self.view.addSubview(hardNumber5!)
            
            hardBalloon5?.image = hardArrayBalloon[4].hardBalloonImage
            hardNumber5?.image = hardArrayBalloon[4].hardBalloonNumber
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.hardRemove4))
            
            hardBalloon5?.isUserInteractionEnabled = true
            hardNumber5?.isUserInteractionEnabled = true
            
            self.hardNumber5?.addGestureRecognizer(tap1)
            self.hardBalloon5?.addGestureRecognizer(tap1)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedHard[3]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {
                
                self.hardBalloon5?.frame.origin.y = 0
                self.hardNumber5?.frame.origin.y = 0
                
                
            }, completion:{_ in self.setHardBalloonUI4() } )
        }
        else
        {
            timerCount.invalidate()
            hardBalloon5?.removeFromSuperview()
            hardNumber5?.removeFromSuperview()
        }
    }
    func hardRemove4()
    {
        self.hardBalloon5?.removeFromSuperview()
        self.hardNumber5?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setHardBalloonUI5()
    {
        self.hardBalloon6?.removeFromSuperview()
        self.hardNumber6?.removeFromSuperview()
        
        if seconds != 0
        {
            hardArrayBalloon.shuffle()
            arrayNumberSpeedHard.shuffle()
            arrayNumbersDelay.shuffle()
            
            hardBalloon6 = UIImageView(frame: CGRect(x: 225, y: view.frame.height, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(hardBalloon6!)
            
            hardNumber6 = UIImageView(frame: CGRect(x: (hardBalloon6?.center.x)! - 5, y: (hardBalloon6?.center.y)!, width: (hardBalloon6?.frame.width)! * 0.30, height: (hardBalloon6?.frame.height)! * 0.30))
            self.view.addSubview(hardNumber6!)
            
            hardBalloon6?.image = hardArrayBalloon[5].hardBalloonImage
            hardNumber6?.image = hardArrayBalloon[5].hardBalloonNumber
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.hardRemove5))
            
            hardBalloon6?.isUserInteractionEnabled = true
            hardNumber6?.isUserInteractionEnabled = true
            
            self.hardNumber6?.addGestureRecognizer(tap1)
            self.hardBalloon6?.addGestureRecognizer(tap1)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedHard[3]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {
                
                self.hardBalloon6?.frame.origin.y = 0
                self.hardNumber6?.frame.origin.y = 0
                
                
            }, completion:{_ in self.setHardBalloonUI5() } )
        }
        else
        {
            timerCount.invalidate()
            hardBalloon6?.removeFromSuperview()
            hardNumber6?.removeFromSuperview()
        }
    }
    func hardRemove5()
    {
        self.hardBalloon6?.removeFromSuperview()
        self.hardNumber6?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setHardBalloonUI6()
    {
        self.hardBalloon7?.removeFromSuperview()
        self.hardNumber7?.removeFromSuperview()
        
        if seconds != 0
        {
            hardArrayBalloon.shuffle()
            arrayNumberSpeedHard.shuffle()
            arrayNumbersDelay.shuffle()
            
            hardBalloon7 = UIImageView(frame: CGRect(x: 270, y: view.frame.height, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(hardBalloon7!)
            
            hardNumber7 = UIImageView(frame: CGRect(x: (hardBalloon7?.center.x)! - 5, y: (hardBalloon7?.center.y)!, width: (hardBalloon7?.frame.width)! * 0.30, height: (hardBalloon7?.frame.height)! * 0.30))
            self.view.addSubview(hardNumber7!)
            
            hardBalloon7?.image = hardArrayBalloon[6].hardBalloonImage
            hardNumber7?.image = hardArrayBalloon[6].hardBalloonNumber
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.hardRemove6))
            
            hardBalloon7?.isUserInteractionEnabled = true
            hardNumber7?.isUserInteractionEnabled = true
            
            self.hardNumber7?.addGestureRecognizer(tap1)
            self.hardBalloon7?.addGestureRecognizer(tap1)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedHard[3]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {
                
                self.hardBalloon7?.frame.origin.y = 0
                self.hardNumber7?.frame.origin.y = 0
                
                
            }, completion:{_ in self.setHardBalloonUI6() } )
        }
        else
        {
            timerCount.invalidate()
            hardBalloon7?.removeFromSuperview()
            hardNumber7?.removeFromSuperview()
        }
    }
    func hardRemove6()
    {
        self.hardBalloon7?.removeFromSuperview()
        self.hardNumber7?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setHardBalloonUI7()
    {
        self.hardBalloon8?.removeFromSuperview()
        self.hardNumber8?.removeFromSuperview()
        
        if seconds != 0
        {
            hardArrayBalloon.shuffle()
            arrayNumberSpeedHard.shuffle()
            arrayNumbersDelay.shuffle()
            
            hardBalloon8 = UIImageView(frame: CGRect(x: 315, y: view.frame.height, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(hardBalloon8!)
            
            hardNumber8 = UIImageView(frame: CGRect(x: (hardBalloon8?.center.x)! - 5, y: (hardBalloon8?.center.y)!, width: (hardBalloon8?.frame.width)! * 0.30, height: (hardBalloon8?.frame.height)! * 0.30))
            self.view.addSubview(hardNumber8!)
            
            hardBalloon8?.image = hardArrayBalloon[7].hardBalloonImage
            hardNumber8?.image = hardArrayBalloon[7].hardBalloonNumber
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.hardRemove7))
            
            hardBalloon8?.isUserInteractionEnabled = true
            hardNumber8?.isUserInteractionEnabled = true
            
            self.hardNumber8?.addGestureRecognizer(tap1)
            self.hardBalloon8?.addGestureRecognizer(tap1)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedHard[3]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {
                
                self.hardBalloon8?.frame.origin.y = 0
                self.hardNumber8?.frame.origin.y = 0
                
                
            }, completion:{_ in self.setHardBalloonUI7() } )
        }
        else
        {
            timerCount.invalidate()
            hardBalloon8?.removeFromSuperview()
            hardNumber8?.removeFromSuperview()
        }
    }
    func hardRemove7()
    {
        self.hardBalloon8?.removeFromSuperview()
        self.hardNumber8?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setHardBalloonUI8()
    {
        self.hardBalloon9?.removeFromSuperview()
        self.hardNumber9?.removeFromSuperview()
        
        if seconds != 0
        {
            hardArrayBalloon.shuffle()
            arrayNumberSpeedHard.shuffle()
            arrayNumbersDelay.shuffle()
            
            hardBalloon9 = UIImageView(frame: CGRect(x: 360, y: view.frame.height, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(hardBalloon9!)
            
            hardNumber9 = UIImageView(frame: CGRect(x: (hardBalloon9?.center.x)! - 5, y: (hardBalloon9?.center.y)!, width: (hardBalloon9?.frame.width)! * 0.30, height: (hardBalloon9?.frame.height)! * 0.30))
            self.view.addSubview(hardNumber9!)
            
            hardBalloon9?.image = hardArrayBalloon[8].hardBalloonImage
            hardNumber9?.image = hardArrayBalloon[8].hardBalloonNumber
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.hardRemove8))
            
            hardBalloon9?.isUserInteractionEnabled = true
            hardNumber9?.isUserInteractionEnabled = true
            
            self.hardNumber9?.addGestureRecognizer(tap1)
            self.hardBalloon9?.addGestureRecognizer(tap1)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedHard[3]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {
                
                self.hardBalloon9?.frame.origin.y = 0
                self.hardNumber9?.frame.origin.y = 0
                
                
            }, completion:{_ in self.setHardBalloonUI8() } )
        }
        else
        {
            timerCount.invalidate()
            hardBalloon9?.removeFromSuperview()
            hardNumber9?.removeFromSuperview()
        }

    }
    func hardRemove8()
    {
        self.hardBalloon9?.removeFromSuperview()
        self.hardNumber9?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setHardBalloonUI9()
    {
        self.hardBalloon10?.removeFromSuperview()
        self.hardNumber10?.removeFromSuperview()
        
        if seconds != 0
        {
            hardArrayBalloon.shuffle()
            arrayNumberSpeedHard.shuffle()
            arrayNumbersDelay.shuffle()
            
            hardBalloon10 = UIImageView(frame: CGRect(x: 405, y: view.frame.height, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(hardBalloon10!)
            
            hardNumber10 = UIImageView(frame: CGRect(x: (hardBalloon10?.center.x)! - 5, y: (hardBalloon10?.center.y)!, width: (hardBalloon10?.frame.width)! * 0.30, height: (hardBalloon10?.frame.height)! * 0.30))
            self.view.addSubview(hardNumber10!)
            
            hardBalloon10?.image = hardArrayBalloon[9].hardBalloonImage
            hardNumber10?.image = hardArrayBalloon[9].hardBalloonNumber
            
            let tap1 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.hardRemove9))
            
            hardBalloon10?.isUserInteractionEnabled = true
            hardNumber10?.isUserInteractionEnabled = true
            
            self.hardNumber10?.addGestureRecognizer(tap1)
            self.hardBalloon10?.addGestureRecognizer(tap1)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedHard[3]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {
                
                self.hardBalloon10?.frame.origin.y = 0
                self.hardNumber10?.frame.origin.y = 0
                
                
            }, completion:{_ in self.setHardBalloonUI9() } )
        }
        else
        {
            timerCount.invalidate()
            hardBalloon10?.removeFromSuperview()
            hardNumber10?.removeFromSuperview()
        }
    }
    func hardRemove9()
    {
        self.hardBalloon10?.removeFromSuperview()
        self.hardNumber10?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }

    
    func setMediumBalloonUI()
    {
        self.mediumBalloon1?.removeFromSuperview()
        self.mediumNumber1?.removeFromSuperview()
        
        print(seconds)
        if seconds != 0
        {
            mediumArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedMedium.shuffle()
            
            mediumBalloon1 = UIImageView(frame: CGRect(x: 0, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(mediumBalloon1!)
            
            mediumNumber1 = UIImageView(frame: CGRect(x: (mediumBalloon1?.center.x)! - 5, y: (mediumBalloon1?.center.y)!, width: (mediumBalloon1?.frame.width)! * 0.30, height: (mediumBalloon1?.frame.height)! * 0.30))
            self.view.addSubview(mediumNumber1!)
            
            mediumBalloon1?.image = mediumArrayBalloon[0].mediumballoonImage
            mediumNumber1?.image = mediumArrayBalloon[0].mediumballoonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.mediumRemove))
            
            mediumBalloon1?.isUserInteractionEnabled = true
            mediumNumber1?.isUserInteractionEnabled = true
            
            self.mediumNumber1?.addGestureRecognizer(tap2)
            self.mediumBalloon1?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedMedium[4]), delay: arrayNumbersDelay[4], options: [.allowUserInteraction], animations: {
                self.mediumNumber1?.addGestureRecognizer(tap2)
                self.mediumBalloon1?.addGestureRecognizer(tap2)
                self.mediumBalloon1?.frame.origin.y = 0
                self.mediumNumber1?.frame.origin.y = 0
                
            }, completion: {_ in self.setMediumBalloonUI() } )
        }
        else{
            mediumNumber1?.removeFromSuperview()
            mediumBalloon1?.removeFromSuperview()

    }
    }
    
    func mediumRemove()
    {
        print("1st image tapped")
        self.mediumBalloon1?.removeFromSuperview()
        self.mediumNumber1?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    
    func setMediumBalloonUI1()
    {
        self.mediumBalloon2?.removeFromSuperview()
        self.mediumNumber2?.removeFromSuperview()
        
        if seconds != 0
        {
            mediumArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedMedium.shuffle()
            
            mediumBalloon2 = UIImageView(frame: CGRect(x: 45, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(mediumBalloon2!)
            
            mediumNumber2 = UIImageView(frame: CGRect(x: (mediumBalloon2?.center.x)! - 5, y: (mediumBalloon2?.center.y)!, width: (mediumBalloon2?.frame.width)! * 0.30, height: (mediumBalloon2?.frame.height)! * 0.30))
            self.view.addSubview(mediumNumber2!)
            
            mediumBalloon2?.image = mediumArrayBalloon[1].mediumballoonImage
            mediumNumber2?.image = mediumArrayBalloon[1].mediumballoonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.mediumRemove1))
            
            mediumBalloon2?.isUserInteractionEnabled = true
            mediumNumber2?.isUserInteractionEnabled = true
            
            self.mediumNumber2?.addGestureRecognizer(tap2)
            self.mediumBalloon2?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedMedium[4]), delay: arrayNumbersDelay[4], options: [.allowUserInteraction], animations: {
                self.mediumNumber2?.addGestureRecognizer(tap2)
                self.mediumBalloon2?.addGestureRecognizer(tap2)
                self.mediumBalloon2?.frame.origin.y = 0
                self.mediumNumber2?.frame.origin.y = 0
                
            }, completion: {_ in self.setMediumBalloonUI1() } )
        }
        else
        {
            self.timerCount.invalidate()
            mediumNumber1?.removeFromSuperview()
            mediumBalloon1?.removeFromSuperview()
        }
    }
    
    func mediumRemove1()
    {
        print("1st image tapped")
        self.mediumBalloon2?.removeFromSuperview()
        self.mediumNumber2?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setMediumBalloonUI2()
    {
        self.mediumBalloon3?.removeFromSuperview()
        self.mediumNumber3?.removeFromSuperview()
        
        if seconds != 0
        {
            mediumArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedMedium.shuffle()
            
            mediumBalloon3 = UIImageView(frame: CGRect(x: 90, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(mediumBalloon3!)
            
            mediumNumber3 = UIImageView(frame: CGRect(x: (mediumBalloon3?.center.x)! - 5, y: (mediumBalloon3?.center.y)!, width: (mediumBalloon3?.frame.width)! * 0.30, height: (mediumBalloon3?.frame.height)! * 0.30))
            self.view.addSubview(mediumNumber3!)
            
            mediumBalloon3?.image = mediumArrayBalloon[2].mediumballoonImage
            mediumNumber3?.image = mediumArrayBalloon[2].mediumballoonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.mediumRemove2))
            
            mediumBalloon3?.isUserInteractionEnabled = true
            mediumNumber3?.isUserInteractionEnabled = true
            
            self.mediumNumber3?.addGestureRecognizer(tap2)
            self.mediumBalloon3?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedMedium[4]), delay: arrayNumbersDelay[4], options: [.allowUserInteraction], animations: {
                self.mediumNumber3?.addGestureRecognizer(tap2)
                self.mediumBalloon3?.addGestureRecognizer(tap2)
                self.mediumBalloon3?.frame.origin.y = 0
                self.mediumNumber3?.frame.origin.y = 0
                
            }, completion: {_ in self.setMediumBalloonUI2() } )
        }
        else{
            timerCount.invalidate()
            mediumNumber3?.removeFromSuperview()
            mediumBalloon3?.removeFromSuperview()
        }

    }
    
    func mediumRemove2()
    {
        print("1st image tapped")
        self.mediumBalloon3?.removeFromSuperview()
        self.mediumNumber3?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setMediumBalloonUI3()
    {
        self.mediumBalloon4?.removeFromSuperview()
        self.mediumNumber4?.removeFromSuperview()
        
        if seconds != 0
        {
            mediumArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedMedium.shuffle()
            
            mediumBalloon4 = UIImageView(frame: CGRect(x: 135, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(mediumBalloon4!)
            
            mediumNumber4 = UIImageView(frame: CGRect(x: (mediumBalloon4?.center.x)! - 5, y: (mediumBalloon4?.center.y)!, width: (mediumBalloon4?.frame.width)! * 0.30, height: (mediumBalloon4?.frame.height)! * 0.30))
            self.view.addSubview(mediumNumber4!)
            
            mediumBalloon4?.image = mediumArrayBalloon[3].mediumballoonImage
            mediumNumber4?.image = mediumArrayBalloon[3].mediumballoonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.mediumRemove3))
            
            mediumBalloon4?.isUserInteractionEnabled = true
            mediumNumber4?.isUserInteractionEnabled = true
            
            self.mediumNumber4?.addGestureRecognizer(tap2)
            self.mediumBalloon4?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedMedium[4]), delay: arrayNumbersDelay[4], options: [.allowUserInteraction], animations: {
                self.mediumNumber4?.addGestureRecognizer(tap2)
                self.mediumBalloon4?.addGestureRecognizer(tap2)
                self.mediumBalloon4?.frame.origin.y = 0
                self.mediumNumber4?.frame.origin.y = 0
                
            }, completion: {_ in self.setMediumBalloonUI3() } )
        }
        else{
            timerCount.invalidate()
            mediumNumber4?.removeFromSuperview()
            mediumBalloon4?.removeFromSuperview()        }
    }
    
    func mediumRemove3()
    {
        print("1st image tapped")
        self.mediumBalloon4?.removeFromSuperview()
        self.mediumNumber4?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setMediumBalloonUI4()
    {
        self.mediumBalloon5?.removeFromSuperview()
        self.mediumNumber5?.removeFromSuperview()
        
        if seconds != 0
        {
            mediumArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedMedium.shuffle()
        
            mediumBalloon5 = UIImageView(frame: CGRect(x: 180, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(mediumBalloon5!)
            
            mediumNumber5 = UIImageView(frame: CGRect(x: (mediumBalloon5?.center.x)! - 5, y: (mediumBalloon5?.center.y)!, width: (mediumBalloon5?.frame.width)! * 0.30, height: (mediumBalloon5?.frame.height)! * 0.30))
            self.view.addSubview(mediumNumber5!)
            
            mediumBalloon5?.image = mediumArrayBalloon[4].mediumballoonImage
            mediumNumber5?.image = mediumArrayBalloon[4].mediumballoonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.mediumRemove4))
            
            mediumBalloon5?.isUserInteractionEnabled = true
            mediumNumber4?.isUserInteractionEnabled = true
            
            self.mediumNumber5?.addGestureRecognizer(tap2)
            self.mediumBalloon5?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedMedium[4]), delay: arrayNumbersDelay[4], options: [.allowUserInteraction], animations: {
                self.mediumNumber5?.addGestureRecognizer(tap2)
                self.mediumBalloon5?.addGestureRecognizer(tap2)
                self.mediumBalloon5?.frame.origin.y = 0
                self.mediumNumber5?.frame.origin.y = 0
                
            }, completion: {_ in self.setMediumBalloonUI4() } )
        }
        else{
            timerCount.invalidate()
            mediumNumber5?.removeFromSuperview()
            mediumBalloon5?.removeFromSuperview()        }

    }
    
    func mediumRemove4()
    {
        print("1st image tapped")
        self.mediumBalloon5?.removeFromSuperview()
        self.mediumNumber5?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setMediumBalloonUI5()
    {
        self.mediumBalloon6?.removeFromSuperview()
        self.mediumNumber6?.removeFromSuperview()
        
        if seconds != 0
        {
            mediumArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedMedium.shuffle()
            
            mediumBalloon6 = UIImageView(frame: CGRect(x: 225, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(mediumBalloon6!)
            
            mediumNumber6 = UIImageView(frame: CGRect(x: (mediumBalloon6?.center.x)! - 5, y: (mediumBalloon6?.center.y)!, width: (mediumBalloon6?.frame.width)! * 0.30, height: (mediumBalloon6?.frame.height)! * 0.30))
            self.view.addSubview(mediumNumber6!)
            
            mediumBalloon6?.image = mediumArrayBalloon[5].mediumballoonImage
            mediumNumber6?.image = mediumArrayBalloon[5].mediumballoonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.mediumRemove5))
            
            mediumBalloon6?.isUserInteractionEnabled = true
            mediumNumber6?.isUserInteractionEnabled = true
            
            self.mediumNumber6?.addGestureRecognizer(tap2)
            self.mediumBalloon6?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedMedium[4]), delay: arrayNumbersDelay[4], options: [.allowUserInteraction], animations: {
                self.mediumNumber6?.addGestureRecognizer(tap2)
                self.mediumBalloon6?.addGestureRecognizer(tap2)
                self.mediumBalloon6?.frame.origin.y = 0
                self.mediumNumber6?.frame.origin.y = 0
                
            }, completion: {_ in self.setMediumBalloonUI5() } )
        }
        else{
            timerCount.invalidate()
            mediumNumber6?.removeFromSuperview()
            mediumBalloon6?.removeFromSuperview()        }
    }
    
    func mediumRemove5()
    {
        print("1st image tapped")
        self.mediumBalloon6?.removeFromSuperview()
        self.mediumNumber6?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    
    func setMediumBalloonUI6()
    {
        self.mediumBalloon7?.removeFromSuperview()
        self.mediumNumber7?.removeFromSuperview()
        
        if seconds != 0
        {
            mediumArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedMedium.shuffle()
            
            mediumBalloon7 = UIImageView(frame: CGRect(x: 270, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(mediumBalloon7!)
            
            mediumNumber7 = UIImageView(frame: CGRect(x: (mediumBalloon7?.center.x)! - 5, y: (mediumBalloon7?.center.y)!, width: (mediumBalloon7?.frame.width)! * 0.30, height: (mediumBalloon7?.frame.height)! * 0.30))
            self.view.addSubview(mediumNumber7!)
            
            mediumBalloon7?.image = mediumArrayBalloon[6].mediumballoonImage
            mediumNumber7?.image = mediumArrayBalloon[6].mediumballoonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.mediumRemove6))
            
            mediumBalloon7?.isUserInteractionEnabled = true
            mediumNumber7?.isUserInteractionEnabled = true
            
            self.mediumNumber7?.addGestureRecognizer(tap2)
            self.mediumBalloon7?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedMedium[4]), delay: arrayNumbersDelay[4], options: [.allowUserInteraction], animations: {
                self.mediumNumber7?.addGestureRecognizer(tap2)
                self.mediumBalloon7?.addGestureRecognizer(tap2)
                self.mediumBalloon7?.frame.origin.y = 0
                self.mediumNumber7?.frame.origin.y = 0
                
            }, completion: {_ in self.setMediumBalloonUI6() } )
        }
        else{
            timerCount.invalidate()
            mediumNumber7?.removeFromSuperview()
            mediumBalloon7?.removeFromSuperview()        }
    }
    
    func mediumRemove6()
    {
        print("1st image tapped")
        self.mediumBalloon7?.removeFromSuperview()
        self.mediumNumber7?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setMediumBalloonUI7()
    {
        self.mediumBalloon8?.removeFromSuperview()
        self.mediumNumber8?.removeFromSuperview()
        
        if seconds != 0
        {
            mediumArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedMedium.shuffle()
            
            mediumBalloon8 = UIImageView(frame: CGRect(x: 315, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(mediumBalloon8!)
            
            mediumNumber8 = UIImageView(frame: CGRect(x: (mediumBalloon8?.center.x)! - 5, y: (mediumBalloon8?.center.y)!, width: (mediumBalloon8?.frame.width)! * 0.30, height: (mediumBalloon8?.frame.height)! * 0.30))
            self.view.addSubview(mediumNumber8!)
            
            mediumBalloon8?.image = mediumArrayBalloon[7].mediumballoonImage
            mediumNumber8?.image = mediumArrayBalloon[7].mediumballoonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.mediumRemove7))
            
            mediumBalloon8?.isUserInteractionEnabled = true
            mediumNumber8?.isUserInteractionEnabled = true
            
            self.mediumNumber8?.addGestureRecognizer(tap2)
            self.mediumBalloon8?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedMedium[4]), delay: arrayNumbersDelay[4], options: [.allowUserInteraction], animations: {
                self.mediumNumber8?.addGestureRecognizer(tap2)
                self.mediumBalloon8?.addGestureRecognizer(tap2)
                self.mediumBalloon8?.frame.origin.y = 0
                self.mediumNumber8?.frame.origin.y = 0
                
            }, completion: {_ in self.setMediumBalloonUI7() } )
        }
        else{
            timerCount.invalidate()
            mediumNumber8?.removeFromSuperview()
            mediumBalloon8?.removeFromSuperview()        }
    }
    
    func mediumRemove7()
    {
        print("1st image tapped")
        self.mediumBalloon8?.removeFromSuperview()
        self.mediumNumber8?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setMediumBalloonUI8()
    {
        self.mediumBalloon9?.removeFromSuperview()
        self.mediumNumber9?.removeFromSuperview()
        
        if seconds != 0
        {
            mediumArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedMedium.shuffle()
            
            mediumBalloon9 = UIImageView(frame: CGRect(x: 360, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(mediumBalloon9!)
            
            mediumNumber9 = UIImageView(frame: CGRect(x: (mediumBalloon9?.center.x)! - 5, y: (mediumBalloon9?.center.y)!, width: (mediumBalloon9?.frame.width)! * 0.30, height: (mediumBalloon9?.frame.height)! * 0.30))
            self.view.addSubview(mediumNumber9!)
            
            mediumBalloon9?.image = mediumArrayBalloon[8].mediumballoonImage
            mediumNumber9?.image = mediumArrayBalloon[8].mediumballoonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.mediumRemove8))
            
            mediumBalloon9?.isUserInteractionEnabled = true
            mediumNumber9?.isUserInteractionEnabled = true
            
            self.mediumNumber9?.addGestureRecognizer(tap2)
            self.mediumBalloon9?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedMedium[4]), delay: arrayNumbersDelay[4], options: [.allowUserInteraction], animations: {
                self.mediumNumber9?.addGestureRecognizer(tap2)
                self.mediumBalloon9?.addGestureRecognizer(tap2)
                self.mediumBalloon9?.frame.origin.y = 0
                self.mediumNumber9?.frame.origin.y = 0
                
            }, completion: {_ in self.setMediumBalloonUI8() } )
        }
        else{
            timerCount.invalidate()
            mediumNumber9?.removeFromSuperview()
            mediumBalloon9?.removeFromSuperview()        }
    }
    
    func mediumRemove8()
    {
        print("1st image tapped")
        self.mediumBalloon9?.removeFromSuperview()
        self.mediumNumber9?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    func setMediumBalloonUI9()
    {
        self.mediumBalloon10?.removeFromSuperview()
        self.mediumNumber10?.removeFromSuperview()
        
        if seconds != 0
        {
            mediumArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedMedium.shuffle()
            
            mediumBalloon10 = UIImageView(frame: CGRect(x: 405, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(mediumBalloon10!)
            
            mediumNumber10 = UIImageView(frame: CGRect(x: (mediumBalloon10?.center.x)! - 5, y: (mediumBalloon10?.center.y)!, width: (mediumBalloon10?.frame.width)! * 0.30, height: (mediumBalloon10?.frame.height)! * 0.30))
            self.view.addSubview(mediumNumber10!)
            
            mediumBalloon10?.image = mediumArrayBalloon[9].mediumballoonImage
            mediumNumber10?.image = mediumArrayBalloon[9].mediumballoonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.mediumRemove9))
            
            mediumBalloon10?.isUserInteractionEnabled = true
            mediumNumber10?.isUserInteractionEnabled = true
            
            self.mediumNumber10?.addGestureRecognizer(tap2)
            self.mediumBalloon10?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedMedium[4]), delay: arrayNumbersDelay[4], options: [.allowUserInteraction], animations: {
                self.mediumNumber10?.addGestureRecognizer(tap2)
                self.mediumBalloon10?.addGestureRecognizer(tap2)
                self.mediumBalloon10?.frame.origin.y = 0
                self.mediumNumber10?.frame.origin.y = 0
                
            }, completion: {_ in self.setMediumBalloonUI9() } )
        }
        else{
            timerCount.invalidate()
            mediumNumber10?.removeFromSuperview()
            mediumBalloon10?.removeFromSuperview()        }
    }
    
    func mediumRemove9()
    {
        self.mediumBalloon10?.removeFromSuperview()
        self.mediumNumber10?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    
    
    
    func setEasyBalloonUI4()
    {
        self.easyBalloon5?.removeFromSuperview()
        self.easyNumber5?.removeFromSuperview()
        
        if seconds != 0
        {
            easyArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedEasy.shuffle()
            
            easyBalloon5 = UIImageView(frame: CGRect(x: 180, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(easyBalloon5!)
            
            easyNumber5 = UIImageView(frame: CGRect(x: (easyBalloon5?.center.x)!-5, y: (easyBalloon5?.center.y)!, width: (easyBalloon5?.frame.width)! * 0.30, height: (easyBalloon5?.frame.height)! * 0.30))
            self.view.addSubview(easyNumber5!)
            
            easyBalloon5?.image = easyArrayBalloon[4].easyBalloonImage
            easyNumber5?.image = easyArrayBalloon[4].easyBalloonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.easyRemove4))
            
            easyBalloon5?.isUserInteractionEnabled = true
            easyNumber5?.isUserInteractionEnabled = true
            
            self.easyNumber5?.addGestureRecognizer(tap2)
            self.easyBalloon5?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedEasy[4]), delay: arrayNumbersDelay[4], options: [.allowUserInteraction], animations: {
                self.easyNumber5?.addGestureRecognizer(tap2)
                self.easyBalloon5?.addGestureRecognizer(tap2)
                self.easyBalloon5?.frame.origin.y = 0
                self.easyNumber5?.frame.origin.y = 0
                
            }, completion: {_ in self.setEasyBalloonUI4() } )
        }
        else{
            counter()
            
        }
    }
 
    func easyRemove4()
    {
        print("3rd image tapped")
        self.easyNumber5?.removeFromSuperview()
        self.easyBalloon5?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    
    
    func setEasyBalloonUI5()
    {
        self.easyBalloon6?.removeFromSuperview()
        self.easyNumber6?.removeFromSuperview()
        
        if seconds != 0
        {
            easyArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedEasy.shuffle()
            
            easyBalloon6 = UIImageView(frame: CGRect(x: 225, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(easyBalloon6!)
            
            easyNumber6 = UIImageView(frame: CGRect(x: (easyBalloon6?.center.x)! - 5, y: (easyBalloon6?.center.y)!, width: (easyBalloon6?.frame.width)! * 0.30, height: (easyBalloon6?.frame.height)! * 0.30))
            self.view.addSubview(easyNumber6!)
            
            easyBalloon6?.image = easyArrayBalloon[5].easyBalloonImage
            easyNumber6?.image = easyArrayBalloon[5].easyBalloonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.easyRemove5))
            
            easyBalloon6?.isUserInteractionEnabled = true
            easyNumber6?.isUserInteractionEnabled = true
            
            self.easyNumber6?.addGestureRecognizer(tap2)
            self.easyBalloon6?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedEasy[5]), delay: arrayNumbersDelay[5], options: [.allowUserInteraction], animations: {
                self.easyNumber6?.addGestureRecognizer(tap2)
                self.easyBalloon6?.addGestureRecognizer(tap2)
                self.easyBalloon6?.frame.origin.y = 0
                self.easyNumber6?.frame.origin.y = 0
                
            }, completion: {_ in self.setEasyBalloonUI5() } )
        }
        else
        {
            timerCount.invalidate()
            easyBalloon6?.removeFromSuperview()
            easyNumber6?.removeFromSuperview()
        }
    }
    func easyRemove5()
    {
        print("3rd image tapped")
        self.easyNumber6?.removeFromSuperview()
        self.easyBalloon6?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    
    func setEasyBalloonUI6()
    {
        self.easyBalloon7?.removeFromSuperview()
        self.easyNumber7?.removeFromSuperview()
        
        if seconds != 0
        {
            easyArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedEasy.shuffle()
            
            easyBalloon7 = UIImageView(frame: CGRect(x: 270, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(easyBalloon7!)
            
            easyNumber7 = UIImageView(frame: CGRect(x: (easyBalloon7?.center.x)! - 5, y: (easyBalloon7?.center.y)!, width: (easyBalloon7?.frame.width)! * 0.30, height: (easyBalloon7?.frame.height)! * 0.30))
            self.view.addSubview(easyNumber7!)
            
            easyBalloon7?.image = easyArrayBalloon[6].easyBalloonImage
            easyNumber7?.image = easyArrayBalloon[6].easyBalloonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.easyRemove6))
            
            easyBalloon7?.isUserInteractionEnabled = true
            easyNumber7?.isUserInteractionEnabled = true
            
            self.easyNumber7?.addGestureRecognizer(tap2)
            self.easyBalloon7?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedEasy[2]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {
                self.easyNumber7?.addGestureRecognizer(tap2)
                self.easyBalloon7?.addGestureRecognizer(tap2)
                self.easyBalloon7?.frame.origin.y = 0
                self.easyNumber7?.frame.origin.y = 0
                
            }, completion: {_ in self.setEasyBalloonUI6() } )
        }
        else
        {
            timerCount.invalidate()
            easyBalloon8?.removeFromSuperview()
            easyNumber8?.removeFromSuperview()
        }
    }
    func easyRemove6()
    {
        print("3rd image tapped")
        self.easyNumber7?.removeFromSuperview()
        self.easyBalloon7?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    
    
    func setEasyBalloonUI7()
    {
        self.easyBalloon8?.removeFromSuperview()
        self.easyNumber8?.removeFromSuperview()
        
        if seconds != 0
        {
            easyArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedEasy.shuffle()
            
            easyBalloon8 = UIImageView(frame: CGRect(x: 315, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(easyBalloon8!)
            
            easyNumber8 = UIImageView(frame: CGRect(x: (easyBalloon8?.center.x)! - 5, y: (easyBalloon8?.center.y)!, width: (easyBalloon8?.frame.width)! * 0.30, height: (easyBalloon8?.frame.height)! * 0.30))
            self.view.addSubview(easyNumber8!)
            
            easyBalloon8?.image = easyArrayBalloon[7].easyBalloonImage
            easyNumber8?.image = easyArrayBalloon[7].easyBalloonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.easyRemove7))
            
            easyBalloon8?.isUserInteractionEnabled = true
            easyNumber8?.isUserInteractionEnabled = true
            
            self.easyNumber8?.addGestureRecognizer(tap2)
            self.easyBalloon8?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedEasy[1]), delay: arrayNumbersDelay[1], options: [.allowUserInteraction], animations: {
                self.easyNumber8?.addGestureRecognizer(tap2)
                self.easyBalloon8?.addGestureRecognizer(tap2)
                self.easyBalloon8?.frame.origin.y = 0
                self.easyNumber8?.frame.origin.y = 0
                
            }, completion: {_ in self.setEasyBalloonUI7() } )
        }
        else
        {
            timerCount.invalidate()
            easyBalloon8?.removeFromSuperview()
            easyNumber8?.removeFromSuperview()
            
        }
    }
    func easyRemove7()
    {
        print("3rd image tapped")
        self.easyNumber8?.removeFromSuperview()
        self.easyBalloon8?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    
    func setEasyBalloonUI8()
    {
        self.easyBalloon9?.removeFromSuperview()
        self.easyNumber9?.removeFromSuperview()
        
        if seconds != 0
        {
            easyArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedEasy.shuffle()
            
            easyBalloon9 = UIImageView(frame: CGRect(x: 360, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(easyBalloon9!)
            
            easyNumber9 = UIImageView(frame: CGRect(x: (easyBalloon9?.center.x)! - 5, y: (easyBalloon9?.center.y)!, width: (easyBalloon9?.frame.width)! * 0.30, height: (easyBalloon9?.frame.height)! * 0.30))
            self.view.addSubview(easyNumber9!)
            
            easyBalloon9?.image = easyArrayBalloon[8].easyBalloonImage
            easyNumber9?.image = easyArrayBalloon[8].easyBalloonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.easyRemove8))
            
            easyBalloon9?.isUserInteractionEnabled = true
            easyNumber9?.isUserInteractionEnabled = true
            
            self.easyNumber9?.addGestureRecognizer(tap2)
            self.easyBalloon9?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedEasy[6]), delay: arrayNumbersDelay[6], options: [.allowUserInteraction], animations: {
                self.easyNumber9?.addGestureRecognizer(tap2)
                self.easyBalloon9?.addGestureRecognizer(tap2)
                self.easyBalloon9?.frame.origin.y = 0
                self.easyNumber9?.frame.origin.y = 0
                
            }, completion: {_ in self.setEasyBalloonUI8() } )
        }
        else
        {
            timerCount.invalidate()
            easyBalloon9?.removeFromSuperview()
            easyNumber9?.removeFromSuperview()
        }
    }
    func easyRemove8()
    {
        print("3rd image tapped")
        self.easyNumber9?.removeFromSuperview()
        self.easyBalloon9?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
    }
    
    func setEasyBalloonUI9()
    {
        self.easyBalloon10?.removeFromSuperview()
        self.easyNumber10?.removeFromSuperview()
        
        if seconds != 0
        {
            easyArrayBalloon.shuffle()
            arrayNumbersDelay.shuffle()
            arrayNumberSpeedEasy.shuffle()
            
            easyBalloon10 = UIImageView(frame: CGRect(x: 405, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(easyBalloon10!)
            
            easyNumber10 = UIImageView(frame: CGRect(x: (easyBalloon10?.center.x)! - 5, y: (easyBalloon10?.center.y)!, width: (easyBalloon10?.frame.width)! * 0.30, height: (easyBalloon10?.frame.height)! * 0.30))
            self.view.addSubview(easyNumber10!)
            
            easyBalloon10?.image = easyArrayBalloon[9].easyBalloonImage
            easyNumber10?.image = easyArrayBalloon[9].easyBalloonNumber
            
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.easyRemove9))
            
            easyBalloon10?.isUserInteractionEnabled = true
            easyNumber10?.isUserInteractionEnabled = true
            
            self.easyNumber10?.addGestureRecognizer(tap2)
            self.easyBalloon10?.addGestureRecognizer(tap2)
            
            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedEasy[5]), delay: arrayNumbersDelay[5], options: [.allowUserInteraction], animations: {
                self.easyNumber10?.addGestureRecognizer(tap2)
                self.easyBalloon10?.addGestureRecognizer(tap2)
                self.easyBalloon10?.frame.origin.y = 0
                self.easyNumber10?.frame.origin.y = 0
                
            }, completion: {_ in self.setEasyBalloonUI9() } )
        }
        else
        {
            timerCount.invalidate()
            easyBalloon10?.removeFromSuperview()
            easyNumber10?.removeFromSuperview()
        }
    }
    func easyRemove9()
    {
        print("3rd image tapped")
        self.easyNumber10?.removeFromSuperview()
        self.easyBalloon10?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)
        
    }
    func setEasyBalloonUI2()
    {
        self.easyBalloon3?.removeFromSuperview()
        self.easyNumber3?.removeFromSuperview()
        
        if seconds != 0
        {
        easyArrayBalloon.shuffle()
        arrayNumbersDelay.shuffle()
        arrayNumberSpeedEasy.shuffle()
        
        easyBalloon3 = UIImageView(frame: CGRect(x: 90, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
        self.view.addSubview(easyBalloon3!)
        
        easyNumber3 = UIImageView(frame: CGRect(x: (easyBalloon3?.center.x)! - 5, y: (easyBalloon3?.center.y)!, width: (easyBalloon3?.frame.width)! * 0.30, height: (easyBalloon3?.frame.height)! * 0.30))
        self.view.addSubview(easyNumber3!)
        
        easyBalloon3?.image = easyArrayBalloon[2].easyBalloonImage
        easyNumber3?.image = easyArrayBalloon[2].easyBalloonNumber
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.easyRemove2))
        
        easyBalloon3?.isUserInteractionEnabled = true
        easyNumber3?.isUserInteractionEnabled = true
        
        self.easyNumber3?.addGestureRecognizer(tap2)
        self.easyBalloon3?.addGestureRecognizer(tap2)
        
        UIView.animate(withDuration: TimeInterval(arrayNumberSpeedEasy[2]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {
            self.easyNumber3?.addGestureRecognizer(tap2)
            self.easyBalloon3?.addGestureRecognizer(tap2)
            self.easyBalloon3?.frame.origin.y = 0
            self.easyNumber3?.frame.origin.y = 0
            
        }, completion: {_ in self.setEasyBalloonUI2() } )
        }
        else
        {
            timerCount.invalidate()
            easyBalloon7?.removeFromSuperview()
            easyNumber7?.removeFromSuperview()
        }
    }
    
    func easyRemove2()
    {
        print("3rd image tapped")
        self.easyNumber3?.removeFromSuperview()
        self.easyBalloon3?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)

    }
    
    func setEasyBalloonUI3()
    {
        self.easyBalloon4?.removeFromSuperview()
        self.easyNumber4?.removeFromSuperview()
        
        if seconds != 0
        {
        
        easyArrayBalloon.shuffle()
        arrayNumbersDelay.shuffle()
        arrayNumberSpeedEasy.shuffle()
        
        easyBalloon4 = UIImageView(frame: CGRect(x: 135, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
        self.view.addSubview(easyBalloon4!)
        
        easyNumber4 = UIImageView(frame: CGRect(x: (easyBalloon4?.center.x)! - 5, y: (easyBalloon4?.center.y)!, width: (easyBalloon4?.frame.width)! * 0.30, height: (easyBalloon4?.frame.height)! * 0.30))
        self.view.addSubview(easyNumber4!)
        
        easyBalloon4?.image = easyArrayBalloon[3].easyBalloonImage
        easyNumber4?.image = easyArrayBalloon[3].easyBalloonNumber
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.easyRemove3))
        
        easyBalloon4?.isUserInteractionEnabled = true
        easyNumber4?.isUserInteractionEnabled = true
        
        self.easyNumber4?.addGestureRecognizer(tap2)
        self.easyBalloon4?.addGestureRecognizer(tap2)
        
        UIView.animate(withDuration: TimeInterval(arrayNumberSpeedEasy[3]), delay: arrayNumbersDelay[3], options: [.allowUserInteraction], animations: {
            self.easyNumber4?.addGestureRecognizer(tap2)
            self.easyBalloon4?.addGestureRecognizer(tap2)
        
            self.easyBalloon4?.frame.origin.y = 0
            self.easyNumber4?.frame.origin.y = 0
            
            
        }, completion: {_ in self.setEasyBalloonUI3() } )
        }
        else
        {
            easyBalloon4?.removeFromSuperview()
            easyNumber4?.removeFromSuperview()
            timerCount.invalidate()
            
        }
    }
    
    func easyRemove3()
    {
        print("4th image tapped")
        self.easyNumber4?.removeFromSuperview()
        self.easyBalloon4?.removeFromSuperview()
        
        score1 += 5
        textFieldScore?.text = String(score1)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        arrayNumberSpeedEasy.shuffle()
    }
    
    /*numbers on balloon set from 1 - 9
      timer set to 60 seconds
      1 balloon added each second
      speed level should be minimal, 1 - 3
    */
    
    func setEasyBalloonUI()
    {
            self.easyBalloon1?.removeFromSuperview()
            self.easyNumber1?.removeFromSuperview()
        
        if seconds != 0
        {
            easyArrayBalloon.shuffle()
            arrayNumberSpeedEasy.shuffle()
            arrayNumbersDelay.shuffle()
        
            easyBalloon1 = UIImageView(frame: CGRect(x: 0, y: view.frame.height, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(easyBalloon1!)
        
            easyNumber1 = UIImageView(frame: CGRect(x: (easyBalloon1?.center.x)! - 5, y: (easyBalloon1?.center.y)!, width: (easyBalloon1?.frame.width)! * 0.30, height: (easyBalloon1?.frame.height)! * 0.30))
            self.view.addSubview(easyNumber1!)
        
            easyBalloon1?.image = easyArrayBalloon[0].easyBalloonImage
            easyNumber1?.image = easyArrayBalloon[0].easyBalloonNumber
        
         let tap1 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.easyRemove))
        
            easyBalloon1?.isUserInteractionEnabled = true
            easyNumber1?.isUserInteractionEnabled = true

            self.easyNumber1?.addGestureRecognizer(tap1)
            self.easyBalloon1?.addGestureRecognizer(tap1)

            UIView.animate(withDuration: TimeInterval(arrayNumberSpeedEasy[1]), delay: arrayNumbersDelay[2], options: [.allowUserInteraction], animations: {
//                self.easyNumber1?.addGestureRecognizer(tap1)
//                self.easyBalloon1?.addGestureRecognizer(tap1)
                self.easyBalloon1?.frame.origin.y = 0
                self.easyNumber1?.frame.origin.y = 0
          
                
            }, completion:{_ in self.setEasyBalloonUI() } )
        }
        else
        {
            timerCount.invalidate()
            easyBalloon1?.removeFromSuperview()
            easyNumber1?.removeFromSuperview()
        }
    }
    func easyRemove()
    {
        print("2nd image tapped")
        self.easyNumber1?.removeFromSuperview()
        self.easyBalloon1?.removeFromSuperview()
        
        if seconds != 1
        {
            score1 += 5
            textFieldScore?.text = String(score1)
        }
        else
        {
            counter()
        }
    }
    
    
  //  var tap2: UITapGestureRecognizer? = nil
    
    
    func easyRemove1()
    {
      print("2nd image tapped")
        self.easyNumber2?.removeFromSuperview()
        self.easyBalloon2?.removeFromSuperview()

        score1 += 5
        textFieldScore?.text = String(score1)
    }
    
    func setEasyBalloonUI1()
    {
        self.easyBalloon2?.removeFromSuperview()
        self.easyNumber2?.removeFromSuperview()
        
        if seconds != 0
        {
        easyArrayBalloon.shuffle()
        arrayNumbersDelay.shuffle()
        arrayNumberSpeedEasy.shuffle()
        
        easyBalloon2 = UIImageView(frame: CGRect(x: 45, y: view.frame.height * 1.01, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
        self.view.addSubview(easyBalloon2!)
        
        easyNumber2 = UIImageView(frame: CGRect(x: (easyBalloon2?.center.x)! - 5, y: (easyBalloon2?.center.y)!, width: (easyBalloon2?.frame.width)! * 0.30, height: (easyBalloon2?.frame.height)! * 0.30))
        self.view.addSubview(easyNumber2!)
        
        easyBalloon2?.image = easyArrayBalloon[1].easyBalloonImage
        easyNumber2?.image = easyArrayBalloon[1].easyBalloonNumber
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(BalloonViewController.easyRemove1))
        
        easyBalloon2?.isUserInteractionEnabled = true
        easyNumber2?.isUserInteractionEnabled = true

        self.easyNumber2?.addGestureRecognizer(tap2)
        self.easyBalloon2?.addGestureRecognizer(tap2)
        
        UIView.animate(withDuration: TimeInterval(arrayNumberSpeedEasy[1]), delay: arrayNumbersDelay[1], options: [.allowUserInteraction], animations: {
            self.easyNumber2?.addGestureRecognizer(tap2)
            self.easyBalloon2?.addGestureRecognizer(tap2)
            self.easyBalloon2?.frame.origin.y = 0
            self.easyNumber2?.frame.origin.y = 0
            
        }, completion: {_ in self.setEasyBalloonUI1() } )
        }
        else
        {
            timerCount.invalidate()
            easyBalloon2?.removeFromSuperview()
            easyNumber2?.removeFromSuperview()
        }

    }
    
    func setBalloonSecondaries()
    {
        textFieldTimer = UITextField(frame: CGRect(x: 0, y: view.frame.height * 0.8, width: view.frame.width * 0.50, height: view.frame.height * 0.3))
        view.addSubview(textFieldTimer)
        
        textFieldScore = UITextField(frame: CGRect(x: view.frame.width * 0.7, y: view.frame.height * 0.8, width: view.frame.width * 0.50, height: view.frame.height * 0.3))
        view.addSubview(textFieldScore)
        
        textFieldTimer.isUserInteractionEnabled = false
        textFieldScore.isUserInteractionEnabled = false
        
        textFieldTimer.leftViewMode = UITextFieldViewMode.always
        textFieldScore.leftViewMode = UITextFieldViewMode.always
        
        
        let image0 = "time"
        let timer = UIImage(named: image0)
        let timeImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 105, height: 30))
        timeImage.image = timer
        textFieldTimer.leftView = timeImage
        
        let image1 = "score"
        let score = UIImage(named: image1)
        let imageViewScore = UIImageView(frame: CGRect(x: 0, y: 0, width: 105, height: 30))
        imageViewScore.image = score
        textFieldScore.leftView = imageViewScore


        switch difficulty {
        case "Easy":
            seconds = 60
            textFieldTimer.text = String(seconds)
            timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)
        case "Medium":
            seconds = 45
            textFieldTimer.text = String(seconds)
            timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)
        case "Hard":
            seconds = 30
            textFieldTimer.text = String(seconds)
            timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)
        default:
            print("default")
        }
        
    }
    
    func counter()
    {
        seconds -= 1
        textFieldTimer.text = String(seconds)
        if(seconds == 0)
        {
            timerCount.invalidate()
            
            let alert0 = UIAlertController(title: "Time is up!", message: "You scored \(score1). Want to play again?", preferredStyle: .alert)
            //                 alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            alert0.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.cancel, handler: { action in self.performSegue(withIdentifier: "unwindToBalloon", sender: self)
            }))
            alert0.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "balloonToHigh", sender: self)
            }))
            
            self.present(alert0, animated: true, completion: nil)
            
            audioPlayer.play()

        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "balloonToHigh")
        {
            let balloonDest: HighScoresViewController = segue.destination as! HighScoresViewController
            
            print("SCORESS", score1)
            balloonDest.scores = score1
            balloonDest.nameOfGame = "Balloon"
            balloonDest.difficultyHigh = difficulty
        }
        
    }

}


