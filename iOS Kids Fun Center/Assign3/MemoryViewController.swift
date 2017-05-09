//
//  MemoryViewController.swift
//  Assign3
//
//  Created by Syed Hyder Rizvi on 3/24/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import AVFoundation
import UIKit

class MemoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    struct memory {
        
        var images: UIImage
    }
    
    var arrayMemory = [memory]()
    var difficulty: String = " "
    var seconds: Int = 0
    var timerCount = Timer()
    var audioPlayer = AVAudioPlayer()
    var scoreAdd = 0
    
    var timerLabel: UITextField!
    var score1: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
//    func didDoubleTapCollectionView(gesture: UITapGestureRecognizer) {
//        var pointInCollectionView: CGPoint = gesture.location(in: self.collectionView)
//        var selectedIndexPath = self.collectionView.indexPathForItem(at: pointInCollectionView)
//
//        var selectedCell: UICollectionViewCell = self.collectionView.cellForItem(at: selectedIndexPath! as IndexPath)!
//        
//    }
    
    
    func tap(sender: UITapGestureRecognizer){
    
        
    if let indexPath = self.collectionView?.indexPathForItem(at: sender.location(in: self.collectionView)) {
  
    let cell = self.collectionView?.cellForItem(at: indexPath) as! MemoryCellCollectionViewCell
    audioPlayer.play()
    scoreAdd += 5
    
        score1.text = String(scoreAdd)
    cell.backgroundImg.isHidden = true
    }
    else
    {
    print("1.) collection view was tapped")
    }
    }
    
    func doubleTap(sender: UITapGestureRecognizer){
        
        
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //  var doubletapgesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("doubleTap:"))
      //  doubletapgesture.numberOfTapsRequired = 2
       // collectionView.addGestureRecognizer(doubletapgesture)
        
        collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))


        self.navigationItem.title = "Memory Game"

        self.navigationItem.hidesBackButton = true
        
        let backgroundImg = UIImage(named: "background")
        
        view.backgroundColor = UIColor(patternImage: backgroundImg!)
        
        collectionView.backgroundColor = UIColor(patternImage: backgroundImg!)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        _ = [1, 2, 3].shuffled()
        // x == [2, 3, 1]
        
        _ = stride(from: 0, through: 100, by: 5).map(String.init).shuffled()
        
        var numbers = [1, 2, 3, 4]
        print("Before Numbers", numbers)

        numbers.shuffle()
        
        print("After Numbers", numbers)
        
        // fiveStrings == ["20", "45", "70", "30", ...]
        
        timerLabel = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 0.50, height: view.frame.height * 0.3))
        view.addSubview(timerLabel)
        
        score1 = UITextField(frame: CGRect(x: view.frame.width * 0.7, y: 0, width: view.frame.width * 0.50, height: view.frame.height * 0.3))
        view.addSubview(score1)
        
        timerLabel.isUserInteractionEnabled = false
        score1.isUserInteractionEnabled = false
        
        timerLabel.leftViewMode = UITextFieldViewMode.always
        
        score1.leftViewMode = UITextFieldViewMode.always
        
        let image0 = "time"
        let timer = UIImage(named: image0)
        let imageView0 = UIImageView(frame: CGRect(x: 0, y: 0, width: 105, height: 30))
        imageView0.image = timer
        timerLabel.leftView = imageView0
        
        let image1 = "score"
        let score = UIImage(named: image1)
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 105, height: 30))
        imageView1.image = score
        score1.leftView = imageView1

      print("difficulty set to level \(difficulty)")
        
        switch difficulty {
        case "Easy":
           seconds = 120
           timerLabel.text = "\(seconds)"
         timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)

        case "Medium":
            seconds = 105
            timerLabel.text = "\(seconds)"
            timerLabel.leftView = imageView0
             timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)

        case "Hard":
            seconds = 90
            timerLabel.text = "\(seconds)"
            timerLabel.leftView = imageView0
           
            timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)

        default:
            seconds = 0
            timerLabel.text = "\(seconds)"
            timerLabel.leftView = imageView0
             timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MemoryViewController.counter), userInfo: nil, repeats: true)

        }
        
         arrayMemory.append(memory(images: UIImage(named: "1")!))
         arrayMemory.append(memory(images: UIImage(named: "1")!))
         arrayMemory.append(memory(images: UIImage(named: "2")!))
         arrayMemory.append(memory(images: UIImage(named: "2")!))
         arrayMemory.append(memory(images: UIImage(named: "3")!))
         arrayMemory.append(memory(images: UIImage(named: "3")!))
         arrayMemory.append(memory(images: UIImage(named: "4")!))
         arrayMemory.append(memory(images: UIImage(named: "4")!))
         arrayMemory.append(memory(images: UIImage(named: "5")!))
         arrayMemory.append(memory(images: UIImage(named: "5")!))
        arrayMemory.append(memory(images: UIImage(named: "6")!))
        arrayMemory.append(memory(images: UIImage(named: "6")!))
        arrayMemory.append(memory(images: UIImage(named: "7")!))
        arrayMemory.append(memory(images: UIImage(named: "7")!))
        arrayMemory.append(memory(images: UIImage(named: "8")!))
        arrayMemory.append(memory(images: UIImage(named: "8")!))
        arrayMemory.append(memory(images: UIImage(named: "9")!))
        arrayMemory.append(memory(images: UIImage(named: "9")!))
        arrayMemory.append(memory(images: UIImage(named: "10")!))
        arrayMemory.append(memory(images: UIImage(named: "10")!))
        
//        arrayMemory.append(memory(images: UIImage(named: "1")!))
//        arrayMemory.append(memory(images: UIImage(named: "2")!))
//        arrayMemory.append(memory(images: UIImage(named: "3")!))
//        arrayMemory.append(memory(images: UIImage(named: "4")!))
//        arrayMemory.append(memory(images: UIImage(named: "5")!))
//        arrayMemory.append(memory(images: UIImage(named: "6")!))
//        arrayMemory.append(memory(images: UIImage(named: "7")!))
//        arrayMemory.append(memory(images: UIImage(named: "8")!))
//        arrayMemory.append(memory(images: UIImage(named: "9")!))
//        arrayMemory.append(memory(images: UIImage(named: "10")!))
        
        do{
        let audio = Bundle.main.path(forResource: "2", ofType: ".mp3")
        try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio!))
        }
        catch
        {
        print("something to do with audio error")
        }
            
    }
    
    var array1: [String] = ["Apples", "Bananas", "Cucumber", "Boxers"]
    
    
    override func viewDidAppear(_ animated: Bool) {
   
        self.navigationItem.hidesBackButton = true
        collectionView.reloadData()
        arrayMemory.shuffle()
        collectionView.reloadData()
   
    }
    
    
    @IBAction func unwindToHome(_ sender: Any) {
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
            
            let alert0 = UIAlertController(title: "You lost!", message: "You scored \(scoreAdd). Want to play again?", preferredStyle: .alert)
            //                 alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            alert0.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.cancel, handler: { action in self.performSegue(withIdentifier: "unwindToMemory", sender: self)
            }))
            alert0.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "sortToHigh", sender: self)
            }))
            
            self.present(alert0, animated: true, completion: nil)
            
            audioPlayer.play()
        }
        else
        {
        switch difficulty {
        case "Easy":
            if (scoreAdd >= 60)
            {
                timerCount.invalidate()
                
                let alert0 = UIAlertController(title: "Max Score!", message: "Good Job! Max Score for easy difficulty is 60. You scored a \(scoreAdd). Want to play again?", preferredStyle: .alert)
                //                 alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                alert0.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.cancel, handler: { action in self.performSegue(withIdentifier: "unwindToMemory", sender: self)
                }))
                alert0.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "sortToHigh", sender: self)
                }))
                
                self.present(alert0, animated: true, completion: nil)
                
                audioPlayer.play()
            }

        case "Medium":
            if (scoreAdd >= 80)
            {
                timerCount.invalidate()
                
                let alert0 = UIAlertController(title: "Max Score!", message: "Good Job! Max Score for medium difficulty 80. You scored a \(scoreAdd). Want to play again?", preferredStyle: .alert)
                //                 alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                alert0.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.cancel, handler: { action in self.performSegue(withIdentifier: "unwindToMemory", sender: self)
                }))
                alert0.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "sortToHigh", sender: self)
                }))
                
                self.present(alert0, animated: true, completion: nil)
                
                audioPlayer.play()
            }
        
       
        case "Hard":
            if (scoreAdd >= 100)
            {
                timerCount.invalidate()
                
                let alert0 = UIAlertController(title: "Max Score!", message: "Good Job! Max Score for hard difficulty is 100. You scored a \(scoreAdd). Want to play again?", preferredStyle: .alert)
                //                 alert0.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                alert0.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.cancel, handler: { action in self.performSegue(withIdentifier: "unwindToMemory", sender: self)
                }))
                alert0.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { action in self.performSegue(withIdentifier: "sortToHigh", sender: self)
                }))
                
                self.present(alert0, animated: true, completion: nil)
                
                audioPlayer.play()
            }
           
        default:
            print("hello")
        }
           }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        switch difficulty {
     
        case "Easy":
            return 12
      
        case "Medium":
            return 16
       
        case "Hard":
           
            return 20
     
        default:
            
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memory", for: indexPath) as! MemoryCellCollectionViewCell
        
        
        cell.foregroundImg.image = arrayMemory[indexPath.row].images
        
        cell.backgroundImg.image = UIImage(named: "question")
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "sortToHigh")
        {
            let memoryDest: HighScoresViewController = segue.destination as! HighScoresViewController
            
            print("SCORESS", scoreAdd)
            memoryDest.scores = scoreAdd
            memoryDest.nameOfGame = "Memory"
            memoryDest.difficultyHigh = difficulty
        }
        
    }
}

extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}



