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
    
    var textFieldTimer: UITextField! = nil
    var textFieldScore: UITextField! = nil
    
    var difficulty: String = " "
    var seconds: Int = 0
    var timerCount = Timer()
    var audioPlayer = AVAudioPlayer()
    
    struct balloonVariables{
        
        var balloonImage: UIImage
        var balloonNumber: UIImage
    }

    var arrayBalloon = [balloonVariables]()
    
    @IBAction func unwindFromBalloon(_ sender: Any) {
        timerCount.invalidate()
        self.performSegue(withIdentifier: "unwindVC", sender: self)
    }
    
  //  func setImageViews(size: CGRect())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Balloon Game"
        
        arrayBalloon.append(balloonVariables(balloonImage: UIImage(named: "color1")!, balloonNumber: UIImage(named:
        "num0")!))
        
        let imageView0 = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        imageView0.image = #imageLiteral(resourceName: "balloonBackground")
        view.addSubview(imageView0)
        
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
        setBalloonUI()


        
    }
    
    func setBalloonUI()
    {
        switch difficulty {
        case "Easy":
            
//            let easyUIView = UIView(frame: CGRect(x: 0, y: view.frame.height * 0.85, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            let easyBalloon1 = UIImageView(frame: CGRect(x: 0, y: view.frame.height * 0.85, width: view.frame.width * 0.10, height: view.frame.height * 0.15))
            self.view.addSubview(easyBalloon1)
            let easyImage1 = UIImageView(frame: CGRect(x: easyBalloon1.center.x - 11, y: easyBalloon1.center.y - 13, width: easyBalloon1.frame.width * 0.50, height: easyBalloon1.frame.height * 0.50))
            self.view.addSubview(easyImage1)
            easyBalloon1.image = arrayBalloon[0].balloonImage
            easyImage1.image = arrayBalloon[0].balloonNumber
            
            UIImageView.animate(withDuration: TimeInterval(4), delay: 0, options: .allowUserInteraction, animations: {
                easyBalloon1.frame.origin.y = 0
                easyImage1.frame.origin.y = 0
            }, completion: {_ in easyBalloon1.removeFromSuperview() })
        default:
            print("default")
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
            seconds = 6000000000
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
            
            let alert0 = UIAlertController(title: "Time is up!", message: "You scored ___", preferredStyle: .alert)
            //                 alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "unwindVC", sender: self)
            }))
            
            self.present(alert0, animated: true, completion: nil)
            
            audioPlayer.play()
        }
    }

}
