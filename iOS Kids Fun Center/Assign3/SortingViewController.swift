//
//  SortingViewController.swift
//  Assign3
//
//  Created by Syed Hyder Rizvi on 3/24/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import AVFoundation
import UIKit

class SortingViewController: UIViewController {

    var difficulty: String = " "
    var audioPlayer = AVAudioPlayer()

    var images: [UIImage] = [
        UIImage(named: "S1")!,
        UIImage(named: "S2")!, UIImage(named: "S3")!, UIImage(named: "S4")!, UIImage(named: "S5")!, UIImage(named: "SS1")!, UIImage(named: "SS2")!, UIImage(named: "SS3")!, UIImage(named: "SS4")!, UIImage(named: "SS5")!, UIImage(named: "SL1")!, UIImage(named: "SL2")!, UIImage(named: "SL3")!, UIImage(named: "SL4")!, UIImage(named: "SL5")!
    ]
    
    var seconds: Int = 0
    var score: Int = 0
    var timerCount = Timer()
    var location = CGPoint(x: 0, y: 0)
    
    var imageEasy7: UIImageView? = nil
    var imageViewUhOH: UIImageView?
    var imageViewUhOH1: UIImageView?
    var imageEasy2: UIImageView? = nil
    var imageEasy3: UIImageView? = nil
    var imageEasy4: UIImageView? = nil
    var imageEasy5: UIImageView? = nil
    var imageEasy6: UIImageView? = nil
    
    var mediumImage0: UIImageView? = nil
    var mediumImage1: UIImageView?
    var mediumImage2: UIImageView? = nil
    var mediumImage3: UIImageView? = nil
    var mediumImage4: UIImageView? = nil
    var mediumImage5: UIImageView? = nil
    var mediumImage6: UIImageView? = nil
    var mediumImage7: UIImageView? = nil
    var mediumImage8: UIImageView? = nil
    var mediumImage9: UIImageView? = nil

    var hardImage0:UIImageView?
    var hardImage1:UIImageView?
    var hardImage2:UIImageView?
    var hardImage3: UIImageView? = nil
    var hardImage4: UIImageView?
    var hardImage5: UIImageView? = nil
    var hardImage6: UIImageView? = nil
    var hardImage7: UIImageView? = nil
    var hardImage8: UIImageView? = nil
    var hardImage9: UIImageView? = nil
    var hardImage10: UIImageView? = nil
    var hardImage11: UIImageView? = nil
    
    var topView: UIView? = nil
    
    var score1: UITextField!
    var timerLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Sorting Game"

        let backgroundView = UIImageView(frame: CGRect(x: 0, y: view.frame.height * 0.25, width: view.frame.width, height: view.frame.height * 0.75))
        backgroundView.image = #imageLiteral(resourceName: "air-land-water")
        view.addSubview(backgroundView)
        
        topView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.25))
        topView?.backgroundColor = UIColor.cyan
        view.addSubview(topView!)
        
        
        timerLabel = UITextField(frame: CGRect(x: 0, y: view.frame.height * 0.8, width: view.frame.width * 0.50, height: view.frame.height * 0.3))
        view.addSubview(timerLabel)
        
        score1 = UITextField(frame: CGRect(x: view.frame.width * 0.7, y: view.frame.height * 0.8, width: view.frame.width * 0.50, height: view.frame.height * 0.3))
        view.addSubview(score1)
        
        timerLabel.isUserInteractionEnabled = false
        score1.isUserInteractionEnabled = false

        self.view.backgroundColor = UIColor.cyan
        
        images.shuffle()
        
//        imageViewUhOH?.isUserInteractionEnabled = true
//        imageViewUhOH1?.isUserInteractionEnabled = true

        do{
            let audio = Bundle.main.path(forResource: "2", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio!))
        }
        catch
        {
            print("something to do with audio error")
        }
        
        setImageCGRect()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first as UITouch!
        location = (touch?.location(in: self.view))!

        if difficulty == "Easy"
        {
            print("ENDING")
            if (imageEasy7?.frame.contains(location))!
            {
                imageEasy7?.center = location
                score += 5
                score1.text = "\(score)"
                
            }
            if (imageViewUhOH?.frame.contains(location))!
            {
                imageViewUhOH?.center = location
                score += 5
                score1.text = "\(score)"
            }
            
            if (imageViewUhOH1?.frame.contains(location))!
            {
                imageViewUhOH1?.center = location
                score += 5
                score1.text = "\(score)"

            }
            if (imageEasy2?.frame.contains(location))!
            {
                print("3rd img tapped")
                imageEasy2?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (imageEasy3?.frame.contains(location))!
            {
                print("4th img tapped")
                imageEasy3?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (imageEasy4?.frame.contains(location))!
            {
                print("5th img tapped")
                imageEasy4?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (imageEasy5?.frame.contains(location))!
            {
                print("6th img tapped")
                imageEasy5?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (imageEasy6?.frame.contains(location))!
            {
                print("6th img tapped")
                imageEasy6?.center = location
                score += 5
                score1.text = "\(score)"
            }

        }
        else if difficulty == "Medium"
        {
            if (mediumImage0?.frame.contains(location))!
            {
                print("first img tapped")
                mediumImage0?.center = location
                score += 5
                score1.text = "\(score)"
            }
            
            if (mediumImage1?.frame.contains(location))!
            {
                mediumImage1?.center = location
                score += 5
                score1.text = "\(score)"
                
            }
            if (mediumImage2?.frame.contains(location))!
            {
                print("second img tapped")
                mediumImage2?.center = location
                score += 5
                score1.text = "\(score)"
            }
            
            if (mediumImage3?.frame.contains(location))!
            {
                mediumImage3?.center = location
                score += 5
                score1.text = "\(score)"
            }
            
            if (mediumImage4?.frame.contains(location))!
            {
                mediumImage4?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (mediumImage5?.frame.contains(location))!
            {
                mediumImage5?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (mediumImage6?.frame.contains(location))!
            {
                mediumImage6?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (mediumImage7?.frame.contains(location))!
            {
                mediumImage7?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (mediumImage8?.frame.contains(location))!
            {
                mediumImage8?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (mediumImage9?.frame.contains(location))!
            {
                mediumImage9?.center = location
                score += 5
                score1.text = "\(score)"
            }
        }
        else if difficulty == "Hard"
        {
            if (hardImage0?.frame.contains(location))!
            {
                hardImage0?.center = location
                score += 5
                score1.text = "\(score)"
            }
            
            if (hardImage1?.frame.contains(location))!
            {
                hardImage1?.center = location
                score += 5
                score1.text = "\(score)"
                
            }
            if (hardImage2?.frame.contains(location))!
            {
                print("second img tapped")
                hardImage2?.center = location
                score += 5
                score1.text = "\(score)"
            }
            
            if (hardImage3?.frame.contains(location))!
            {
                hardImage3?.center = location
                score += 5
                score1.text = "\(score)"
            }
            
            if (hardImage4?.frame.contains(location))!
            {
                hardImage4?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (hardImage5?.frame.contains(location))!
            {
                hardImage5?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (hardImage6?.frame.contains(location))!
            {
                hardImage6?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (hardImage7?.frame.contains(location))!
            {
                hardImage7?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (hardImage8?.frame.contains(location))!
            {
                hardImage8?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (hardImage9?.frame.contains(location))!
            {
                hardImage9?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (hardImage10?.frame.contains(location))!
            {
                hardImage10?.center = location
                score += 5
                score1.text = "\(score)"
            }
            if (hardImage11?.frame.contains(location))!
            {
                hardImage11?.center = location
                score += 5
                score1.text = "\(score)"
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first as UITouch!
        
        location = (touch?.location(in: self.view))!
        
        if difficulty == "Easy"
        {
            if (imageEasy7?.frame.contains(location))!
            {
                imageEasy7?.center = location
                
            }
            if (imageViewUhOH?.frame.contains(location))!
            {
                print("first img tapped")
                imageViewUhOH?.center = location
            }
                
            if (imageViewUhOH1?.frame.contains(location))!
            {
                print("second img tapped")
                imageViewUhOH1?.center = location
            }
            if (imageEasy2?.frame.contains(location))!
            {
                print("3rd img tapped")
                imageEasy2?.center = location
            }
            if (imageEasy3?.frame.contains(location))!
            {
                print("4th img tapped")
                imageEasy3?.center = location
            }
            if (imageEasy4?.frame.contains(location))!
            {
                print("5th img tapped")
                imageEasy4?.center = location
            }
            if (imageEasy5?.frame.contains(location))!
            {
                print("6th img tapped")
                imageEasy5?.center = location
            }
            if (imageEasy6?.frame.contains(location))!
            {
                print("6th img tapped")
                imageEasy6?.center = location
            }


        }
        else if difficulty == "Medium"
        {
            if (mediumImage0?.frame.contains(location))!
            {
                print("first img tapped")
                mediumImage0?.center = location
            }
            
            if (mediumImage1?.frame.contains(location))!
            {
                mediumImage1?.center = location
                
            }
            if (mediumImage2?.frame.contains(location))!
            {
                print("second img tapped")
                mediumImage2?.center = location
            }
            
            if (mediumImage3?.frame.contains(location))!
            {
                mediumImage3?.center = location
            }
            
            if (mediumImage4?.frame.contains(location))!
            {
                mediumImage4?.center = location
            }
            if (mediumImage5?.frame.contains(location))!
            {
                mediumImage5?.center = location
            }
            if (mediumImage6?.frame.contains(location))!
            {
                mediumImage6?.center = location
            }
            if (mediumImage7?.frame.contains(location))!
            {
                mediumImage7?.center = location
            }
            if (mediumImage8?.frame.contains(location))!
            {
                mediumImage8?.center = location
            }
            if (mediumImage9?.frame.contains(location))!
            {
                mediumImage9?.center = location
            }
            
        }
        else if difficulty == "Hard"
        {
            if (hardImage0?.frame.contains(location))!
            {
                hardImage0?.center = location
            }
            
            if (hardImage1?.frame.contains(location))!
            {
                hardImage1?.center = location
                
            }
            if (hardImage2?.frame.contains(location))!
            {
                print("second img tapped")
                hardImage2?.center = location
            }
            
            if (hardImage3?.frame.contains(location))!
            {
                hardImage3?.center = location
            }
            
            if (hardImage4?.frame.contains(location))!
            {
                hardImage4?.center = location
            }
            if (hardImage5?.frame.contains(location))!
            {
                hardImage5?.center = location
            }
            if (hardImage6?.frame.contains(location))!
            {
                hardImage6?.center = location
            }
            if (hardImage7?.frame.contains(location))!
            {
                hardImage7?.center = location
            }
            if (hardImage8?.frame.contains(location))!
            {
                hardImage8?.center = location
            }
            if (hardImage9?.frame.contains(location))!
            {
                hardImage9?.center = location
            }
            if (hardImage10?.frame.contains(location))!
            {
                hardImage10?.center = location
            }
            if (hardImage11?.frame.contains(location))!
            {
                hardImage11?.center = location
            }
        else
        {
            print("default")
        }

    }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        let touch: UITouch = touches.first as UITouch!

        location = touch.location(in: self.view)
        
        if difficulty == "Easy"
        {
            
            if (imageEasy7?.frame.contains(location))!
            {
                imageEasy7?.center = location

            }
        if (imageViewUhOH?.frame.contains(location))!
        {
            print("first img tapped")
            imageViewUhOH?.center = location
        }
            
            if (imageViewUhOH1?.frame.contains(location))!
        {
            print("second img tapped")
            imageViewUhOH1?.center = location
        }
            if (imageEasy2?.frame.contains(location))!
            {
                print("3rd img tapped")
                imageEasy2?.center = location
            }
            if (imageEasy3?.frame.contains(location))!
            {
                print("4th img tapped")
                imageEasy3?.center = location
            }
            if (imageEasy4?.frame.contains(location))!
            {
                print("5th img tapped")
                imageEasy4?.center = location
            }
            if (imageEasy5?.frame.contains(location))!
            {
                print("6th img tapped")
                imageEasy5?.center = location
            }
            if (imageEasy6?.frame.contains(location))!
            {
                print("6th img tapped")
                imageEasy6?.center = location
            }
        }
            
            
        else if difficulty == "Medium"
        {
            if (mediumImage0?.frame.contains(location))!
            {
                print("first img tapped")
                mediumImage0?.center = location
            }
        
            if (mediumImage1?.frame.contains(location))!
            {
                mediumImage1?.center = location
            }
            
            if (mediumImage2?.frame.contains(location))!
            {
                print("second img tapped")
                mediumImage2?.center = location
            }
        
            if (mediumImage3?.frame.contains(location))!
            {
                mediumImage3?.center = location
            }
            
            if (mediumImage4?.frame.contains(location))!
            {
                mediumImage4?.center = location
            }
            if (mediumImage5?.frame.contains(location))!
            {
                mediumImage5?.center = location
            }
            if (mediumImage6?.frame.contains(location))!
            {
                mediumImage6?.center = location
            }
            if (mediumImage7?.frame.contains(location))!
            {
                mediumImage7?.center = location
            }
            if (mediumImage8?.frame.contains(location))!
            {
                mediumImage8?.center = location
            }
            if (mediumImage9?.frame.contains(location))!
            {
                mediumImage9?.center = location
            }
        }
        else if difficulty == "Hard"
        {
            if (hardImage0?.frame.contains(location))!
            {
                hardImage0?.center = location
            }
            
            if (hardImage1?.frame.contains(location))!
            {
                hardImage1?.center = location
                
            }
            if (hardImage2?.frame.contains(location))!
            {
                print("second img tapped")
                hardImage2?.center = location
            }
            
            if (hardImage3?.frame.contains(location))!
            {
                hardImage3?.center = location
            }
            
            if (hardImage4?.frame.contains(location))!
            {
                hardImage4?.center = location
            }
            if (hardImage5?.frame.contains(location))!
            {
                hardImage5?.center = location
            }
            if (hardImage6?.frame.contains(location))!
            {
                hardImage6?.center = location
            }
            if (hardImage7?.frame.contains(location))!
            {
                hardImage7?.center = location
            }
            if (hardImage8?.frame.contains(location))!
            {
                hardImage8?.center = location
            }
            if (hardImage9?.frame.contains(location))!
            {
                hardImage9?.center = location
            }
            if (hardImage10?.frame.contains(location))!
            {
                hardImage10?.center = location
            }
            if (hardImage11?.frame.contains(location))!
            {
                hardImage11?.center = location
            }

        }
        else
        {
            print("default")
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        images.shuffle()
    }
    
    @IBAction func unwindButton(_ sender: Any) {
        timerCount.invalidate()
        self.performSegue(withIdentifier: "unwindVC", sender: self)
    }
    
    
    func counter()
    {
        seconds -= 1
        timerLabel.text = String(seconds)
        if(seconds == 0)
        {
            timerCount.invalidate()
            
        
            let alert0 = UIAlertController(title: "Time is up!", message: "You scored \(score). Want to play again?", preferredStyle: .alert)
            //                 alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            alert0.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.cancel, handler: { action in self.performSegue(withIdentifier: "unwindToSorting", sender: self)
            }))
            alert0.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "sortToHigh", sender: self)
            }))
            
            self.present(alert0, animated: true, completion: nil)
            
            audioPlayer.play()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "sortToHigh")
        {
        let sortingDest: HighScoresViewController = segue.destination as! HighScoresViewController
        
        print("SCORESS", score)
        sortingDest.scores = score
        sortingDest.nameOfGame = "Sorting"
        sortingDest.difficultyHigh = difficulty
        }
        
    }
    
    func setImageCGRect()
    {
        timerLabel.leftViewMode = UITextFieldViewMode.always
        
        score1.leftViewMode = UITextFieldViewMode.always
        
        let image0 = "time"
        let timer = UIImage(named: image0)
        let timerImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 20))
        timerImage.image = timer
        timerLabel.leftView = timerImage
        
        let image1 = "score"
        let score = UIImage(named: image1)
        let imageViewScore = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 20))
        imageViewScore.image = score
        score1.leftView = imageViewScore
      
     //   let backgroundIMG = UIImage(named: "air-land-water")
    //    self.view.backgroundColor = UIColor(patternImage: backgroundIMG!)

        
        switch difficulty {
        case "Easy":
            print("hello")
            seconds = 60 //60
            timerLabel.text = "\(seconds)"
            timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)
        
            imageEasy7 = UIImageView(frame: CGRect(x: 34, y: view.frame.height*0.10 + 5, width: view.frame.width * 0.07, height: view.frame.height * 0.10))
            imageEasy7?.image = images[0]
            view.addSubview(imageEasy7!)
            
            imageViewUhOH = UIImageView(frame: CGRect(x: (imageEasy7?.frame.width)! + 51, y: view.frame.height*0.10 + 5, width: view.frame.width * 0.07, height: view.frame.height * 0.10))
            imageViewUhOH?.image = images[1]
            view.addSubview(imageViewUhOH!)
            
            imageViewUhOH1 = UIImageView(frame: CGRect(x: (imageEasy7?.frame.width)! + 102, y: view.frame.height*0.10 + 5, width: view.frame.width * 0.07, height: view.frame.height * 0.10))
            imageViewUhOH1?.image = images[2]
            view.addSubview(imageViewUhOH1!)
            
            imageEasy2 = UIImageView(frame: CGRect(x: (imageEasy7?.frame.width)! + 153, y: view.frame.height*0.10 + 5, width: view.frame.width * 0.07, height: view.frame.height * 0.10))
            imageEasy2?.image = images[3]
            view.addSubview(imageEasy2!)
            
            imageEasy3 = UIImageView(frame: CGRect(x: (imageEasy7?.frame.width)! + 204, y: view.frame.height*0.10 + 5, width: view.frame.width * 0.07, height: view.frame.height * 0.10))
            imageEasy3?.image = images[4]
            view.addSubview(imageEasy3!)
            
            imageEasy4 = UIImageView(frame: CGRect(x: (imageEasy7?.frame.width)! + 255, y: view.frame.height*0.10 + 5, width: view.frame.width * 0.07, height: view.frame.height * 0.10))
            imageEasy4?.image = images[5]
            view.addSubview(imageEasy4!)
            
            imageEasy5 = UIImageView(frame: CGRect(x: (imageEasy7?.frame.width)! + 306, y: view.frame.height*0.10 + 5, width: view.frame.width * 0.07, height: view.frame.height * 0.10))
            imageEasy5?.image = images[6]
            view.addSubview(imageEasy5!)
            
            imageEasy6 = UIImageView(frame: CGRect(x: (imageEasy7?.frame.width)! + 357, y: view.frame.height*0.10 + 5, width: view.frame.width * 0.07, height: view.frame.height * 0.10))
            imageEasy6?.image = images[7]
            view.addSubview(imageEasy6!)

        case "Medium":
            print("heelo")
            seconds = 45 //45
         
            timerLabel.text = "\(seconds)"
            timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)
            
//            let topView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.25))
//            topView.backgroundColor = UIColor.cyan
            view.addSubview(topView!)
            
            mediumImage0 = UIImageView(frame: CGRect(x: 30, y: (topView?.frame.height)!*0.40 + 5, width: (topView?.frame.width)! * 0.07, height: (topView?.frame.height)! * 0.40))
            mediumImage0?.image = images[0]
            topView?.addSubview(mediumImage0!)
            
            mediumImage1 = UIImageView(frame: CGRect(x: (mediumImage0?.frame.width)! + 41, y: (topView?.frame.height)!*0.40 + 5, width: (topView?.frame.width)! * 0.07, height: (topView?.frame.height)! * 0.40))
            mediumImage1?.image = images[1]
            topView?.addSubview(mediumImage1!)
            
            mediumImage2 = UIImageView(frame: CGRect(x: (mediumImage0?.frame.width)! + 82, y: (topView?.frame.height)!*0.40 + 5, width: (topView?.frame.width)! * 0.07, height: (topView?.frame.height)! * 0.40))
            mediumImage2?.image = images[2]
            topView?.addSubview(mediumImage2!)
            
            mediumImage3 = UIImageView(frame: CGRect(x: (mediumImage0?.frame.width)! + 123, y: (topView?.frame.height)!*0.40 + 5, width: (topView?.frame.width)! * 0.07, height: (topView?.frame.height)! * 0.40))
            mediumImage3?.image = images[3]
            topView?.addSubview(mediumImage3!)
            
            mediumImage4 = UIImageView(frame: CGRect(x: (mediumImage0?.frame.width)! + 164, y: (topView?.frame.height)!*0.40 + 5, width: (topView?.frame.width)! * 0.07, height: (topView?.frame.height)! * 0.40))
            mediumImage4?.image = images[4]
            topView?.addSubview(mediumImage4!)
            
            mediumImage5 = UIImageView(frame: CGRect(x: (mediumImage0?.frame.width)! + 205, y: (topView?.frame.height)!*0.40 + 5, width: (topView?.frame.width)! * 0.07, height: (topView?.frame.height)! * 0.40))
            mediumImage5?.image = images[5]
            topView?.addSubview(mediumImage5!)
            
            mediumImage6 = UIImageView(frame: CGRect(x: (mediumImage0?.frame.width)! + 246, y: (topView?.frame.height)!*0.40 + 5, width: (topView?.frame.width)! * 0.07, height: (topView?.frame.height)! * 0.40))
            mediumImage6?.image = images[6]
            topView?.addSubview(mediumImage6!)
            
            mediumImage7 = UIImageView(frame: CGRect(x: (mediumImage0?.frame.width)! + 287, y: (topView?.frame.height)!*0.40 + 5, width: (topView?.frame.width)! * 0.07, height: (topView?.frame.height)! * 0.40))
            mediumImage7?.image = images[7]
            topView?.addSubview(mediumImage7!)
            
            mediumImage8 = UIImageView(frame: CGRect(x: (mediumImage0?.frame.width)! + 328, y: (topView?.frame.height)!*0.40 + 5, width: (topView?.frame.width)! * 0.07, height: (topView?.frame.height)! * 0.40))
            mediumImage8?.image = images[8]
            topView?.addSubview(mediumImage8!)
            
            mediumImage9 = UIImageView(frame: CGRect(x: (mediumImage0?.frame.width)! + 369, y: (topView?.frame.height)!*0.40 + 5, width: (topView?.frame.width)! * 0.07, height: (topView?.frame.height)! * 0.40))
            mediumImage9?.image = images[9]
            topView?.addSubview(mediumImage9!)
            
        case "Hard":
            print("hello")
            seconds = 30 //30
            timerLabel.text = "\(seconds)"
            timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)
            
            let topView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.25))
            topView.backgroundColor = UIColor.cyan
            view.addSubview(topView)
            
            hardImage0 = UIImageView(frame: CGRect(x: 34, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            hardImage0?.image = images[0]
            topView.addSubview(hardImage0!)
            
            hardImage1 = UIImageView(frame: CGRect(x: (hardImage0?.frame.width)! + 34, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            hardImage1?.image = images[1]
            topView.addSubview(hardImage1!)
            
            hardImage2 = UIImageView(frame: CGRect(x: (hardImage0?.frame.width)! + 68, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            hardImage2?.image = images[2]
            topView.addSubview(hardImage2!)
            
             hardImage3 = UIImageView(frame: CGRect(x: (hardImage0?.frame.width)! + 102, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            hardImage3?.image = images[3]
            topView.addSubview(hardImage3!)
            
            hardImage4 = UIImageView(frame: CGRect(x: (hardImage0?.frame.width)! + 136, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            hardImage4?.image = images[4]
            topView.addSubview(hardImage4!)
            
            hardImage5 = UIImageView(frame: CGRect(x: (hardImage0?.frame.width)! + 170, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            hardImage5?.image = images[5]
            topView.addSubview(hardImage5!)
            
            hardImage6 = UIImageView(frame: CGRect(x: (hardImage0?.frame.width)! + 204, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            hardImage6?.image = images[6]
            topView.addSubview(hardImage6!)
            
            hardImage7 = UIImageView(frame: CGRect(x: (hardImage0?.frame.width)! + 238, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            hardImage7?.image = images[7]
            topView.addSubview(hardImage7!)
            
            hardImage8 = UIImageView(frame: CGRect(x: (hardImage0?.frame.width)! + 272, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            hardImage8?.image = images[8]
            topView.addSubview(hardImage8!)
            
            hardImage9 = UIImageView(frame: CGRect(x: (hardImage0?.frame.width)! + 306, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            hardImage9?.image = images[9]
            topView.addSubview(hardImage9!)
            
            hardImage10 = UIImageView(frame: CGRect(x: (hardImage0?.frame.width)! + 340, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            hardImage10?.image = images[10]
            topView.addSubview(hardImage10!)
            
            hardImage11 = UIImageView(frame: CGRect(x: (hardImage0?.frame.width)! + 374, y: topView.frame.height*0.40 + 5, width: topView.frame.width * 0.07, height: topView.frame.height * 0.40))
            hardImage11?.image = images[11]
            topView.addSubview(hardImage11!)
        default:
            print("default")
        }
    
    
}
}
