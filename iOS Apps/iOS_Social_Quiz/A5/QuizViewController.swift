//
//  QuizViewController.swift
//  A5
//
//  Created by Zachary Kimpfler on 4/27/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit
import MBProgressHUD
import MultipeerConnectivity
import CoreMotion

var numberOfRestarts = 1

class QuizViewController: UIViewController {
    
    /*
     TO-DO
     
     Get other players to recieve new question set on restart
     
 */
    
    let motionManager = CMMotionManager()
    
    var questions = [Question]()
    var backupQuestions = [Question]()
    var currentQuestion: Question?
    var selectedOption: UIButton?
    var playerOneNumberCorrectAnswers = 0
    var playerTwoNumberCorrectAnswers = 0
    var playerThreeNumberCorrectAnswers = 0
    var playerFourNumberCorrectAnswers = 0
    var countDownTimer: Timer?
    var timeRemaining = 13
    var peers = [MCPeerID]()
    var session: MCSession?
    var answerSubmitted = false
    var totalNumberOfQuestions = 0
    
    @IBOutlet weak var player1Icon: UIImageView!
    @IBOutlet weak var player2Icon: UIImageView!
    @IBOutlet weak var player3Icon: UIImageView!
    @IBOutlet weak var player4Icon: UIImageView!
    
    @IBOutlet weak var player1Bubble: UILabel!
    @IBOutlet weak var player2Bubble: UILabel!
    @IBOutlet weak var player3Bubble: UILabel!
    @IBOutlet weak var player4Bubble: UILabel!
    
    @IBOutlet weak var player1BubbleImage: UIImageView!
    @IBOutlet weak var player2BubbleImage: UIImageView!
    @IBOutlet weak var player3BubbleImage: UIImageView!
    @IBOutlet weak var player4BubbleImage: UIImageView!
    
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player3Name: UILabel!
    @IBOutlet weak var player4Name: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    
    @IBOutlet weak var playerOneScoreLabel: UILabel!
    @IBOutlet weak var playerTwoScoreLabel: UILabel!
    @IBOutlet weak var playerThreeScoreLabel: UILabel!
    @IBOutlet weak var playerFourScoreLabel: UILabel!
    
    @IBOutlet weak var questionCountLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var restartQuizButton: UIButton!
    
    var currentZ = 0.0
    var currentX = 0.0
    var currentY = 0.0
    
    var previousRoll = 0.0
    var previousPitch = 0.0
    var previousYaw = 0.0
    

    var numberOfRestarts = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "General"
        restartQuizButton.isHidden = true
        configurePlayers()
        session?.delegate = self
        downloadQuestions()
        let motionQueue = OperationQueue()
        
        motionManager.startAccelerometerUpdates(to: motionQueue) { (data, error) in
            if let motionData = data {
                if self.currentZ != 0 {
                    let theZ = motionData.acceleration.z
                    if self.currentZ - theZ > 0.5 {
                        if let theSelectedOption = self.selectedOption {
                            DispatchQueue.main.async {
                                self.optionButtonPressed(theSelectedOption)
                            }
                        }
                    }
                    self.currentZ = theZ
                }
                self.currentZ = motionData.acceleration.z
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.motionManager.deviceMotionUpdateInterval = 1.0/60.0
        self.motionManager.startDeviceMotionUpdates(using: .xArbitraryCorrectedZVertical)
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateDeviceMotion), userInfo: nil, repeats: true)
        
        let cmmam = CMMotionActivityManager()
        cmmam.startActivityUpdates(to: .main, withHandler: { (data) in
            if let inVehicle = data?.automotive{
                
                if (inVehicle) {
                    print(" I am inside a vehicle")
                }
            }
        })

    }
    
    func updateDeviceMotion(){
        
        if let data = self.motionManager.deviceMotion {
            
            // orientation of body relat    ive to a reference frame
            let attitude = data.attitude
            
            if previousYaw != 0 && previousRoll != 0 && previousPitch != 0 {
                if previousRoll - attitude.roll > 0.5 {
                    if selectedOption?.tag == 1 {
                        self.optionButtonPressed(option1Button)
                    }
                    else if selectedOption?.tag == 3 {
                        self.optionButtonPressed(option3Button)
                    }
                }
                else if previousRoll - attitude.roll < -0.5 {
                    if selectedOption?.tag == 0 {
                        self.optionButtonPressed(option2Button)
                    }
                    else if selectedOption?.tag == 2 {
                        self.optionButtonPressed(option4Button)
                    }
                }
                
                if previousPitch - attitude.pitch > 0.5 {
                    if selectedOption?.tag == 2 {
                        self.optionButtonPressed(option1Button)
                    }
                    else if selectedOption?.tag == 3 {
                        self.optionButtonPressed(option2Button)
                    }

                }
                else if previousPitch - attitude.pitch < -0.5 {
                    if selectedOption?.tag == 0 {
                        self.optionButtonPressed(option3Button)
                    }
                    else if selectedOption?.tag == 1 {
                        self.optionButtonPressed(option4Button)
                    }
                }
            }
            
            previousYaw = attitude.yaw
            previousPitch = attitude.pitch
            previousRoll = attitude.roll
            
        }
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if !answerSubmitted {
                selectRandomOption()
            }
        }
    }
    
    
    func selectNextOption() {
        let optionButtons = [option1Button, option2Button, option3Button, option4Button]
        if let currentIndex = selectedOption?.tag {
            if currentIndex < 3 {
                selectedOption?.isSelected = false
                optionButtons[currentIndex + 1]?.isSelected = true
                selectedOption = optionButtons[currentIndex + 1]
            }
        }
    }
    
    func selectPreviousOption() {
        let optionButtons = [option1Button, option2Button, option3Button, option4Button]
        if let currentIndex = selectedOption?.tag {
            if currentIndex > 0 {
                selectedOption?.isSelected = false
                optionButtons[currentIndex - 1]?.isSelected = true
                selectedOption = optionButtons[currentIndex - 1]
            }
        }
    }
    
    
    func selectRandomOption() {
        let optionButtons = [option1Button, option2Button, option3Button, option4Button]
        //get random number 0-4
        let index = Int(arc4random_uniform(UInt32(optionButtons.count)))
        if optionButtons[index] == selectedOption {
            selectRandomOption()
            return
        }
        selectedOption?.isSelected = false
        optionButtons[index]?.isSelected = true
        selectedOption = optionButtons[index]
        
        //Check that the random number != selectedOPtion.tag
            //if yes, recursive
            //if not, return random number
        
        
    }
    
    func startQuiz() {
        
        questions = backupQuestions
        restartQuizButton.isHidden = true
        selectedOption?.isSelected = false
        selectedOption = nil
        answerSubmitted = false
        currentQuestion = nil
        timeRemaining = 13
        playerOneNumberCorrectAnswers = 0
        playerTwoNumberCorrectAnswers = 0
        playerThreeNumberCorrectAnswers = 0
        playerFourNumberCorrectAnswers = 0
        playerOneScoreLabel.text = String(self.playerOneNumberCorrectAnswers)
        playerTwoScoreLabel.text = String(self.playerTwoNumberCorrectAnswers)
        playerThreeScoreLabel.text = String(self.playerThreeNumberCorrectAnswers)
        playerFourScoreLabel.text = String(self.playerFourNumberCorrectAnswers)
        player1Bubble.text = ""
        player2Bubble.text = ""
        player3Bubble.text = ""
        player4Bubble.text = ""
        displayNextQuestion()
        
        countDownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.timeRemaining -= 1
            self.countDownLabel.text = "\(self.timeRemaining - 3)"
            
            //If everyone has answered, set timeRemaing = 3
            if self.peers.count == 1 {
                if !self.player1BubbleImage.isHidden && !self.player2BubbleImage.isHidden {
                    self.timeRemaining = min(self.timeRemaining, 3)
                }
            }
            else if self.peers.count == 2 {
                if !self.player1BubbleImage.isHidden && !self.player2BubbleImage.isHidden && !self.player3BubbleImage.isHidden {
                    self.timeRemaining = min(self.timeRemaining, 3)
                }
            }
            else if self.peers.count == 3 {
                if !self.player1BubbleImage.isHidden && !self.player2BubbleImage.isHidden && !self.player3BubbleImage.isHidden && !self.player4BubbleImage.isHidden {
                    self.timeRemaining = min(self.timeRemaining, 3)
                }
            }
            
            if self.timeRemaining <= 3 {
                var optionCharacter = ""
                if let correctAnswer = self.currentQuestion?.correctOption {
                    switch correctAnswer {
                    case 0:
                        optionCharacter = "A"
                    case 1:
                        optionCharacter = "B"
                    case 2:
                        optionCharacter = "C"
                    case 3:
                        optionCharacter = "D"
                    default:
                        optionCharacter = "PANIC"
                    }
                }
                
                if let answer = self.selectedOption?.tag {

                    if self.answerSubmitted == false {
                        self.submitAnswer(answer: answer)
                    }
                }
                
                
                self.countDownLabel.text = "The correct answer was \(optionCharacter)!"
                
                
                self.player2Bubble.isHidden = false
                self.player3Bubble.isHidden = false
                self.player4Bubble.isHidden = false
                
                // Go to next question or end game
                if self.questions.count <= 0 {
                    // end game
                    self.endGame()
                }
                else {
                    if self.timeRemaining <= 0 {
                        self.displayNextQuestion()
                    }
                    
                }
                
                print("*** playerOneNumberCorrectAnswers: \(self.playerOneNumberCorrectAnswers) and \(self.playerTwoNumberCorrectAnswers)")
                self.playerOneScoreLabel.text = String(self.playerOneNumberCorrectAnswers)
                self.playerTwoScoreLabel.text = String(self.playerTwoNumberCorrectAnswers)
                self.playerThreeScoreLabel.text = String(self.playerThreeNumberCorrectAnswers)
                self.playerFourScoreLabel.text = String(self.playerFourNumberCorrectAnswers)
                
            }
        })
    }
    
    
    func downloadQuestions() {
        MBProgressHUD.showAdded(to: view, animated: true)
//         if numberOfRestarts == 3
//         {
//             numberOfRestarts = 1
//         }
        Utility.shared.downloadQuizDataWith(pageNumber: numberOfRestarts) { (downloadedQuestions, error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if let theQuestions = downloadedQuestions {
                self.questions = theQuestions
                self.backupQuestions = theQuestions
                self.totalNumberOfQuestions = theQuestions.count
                self.startQuiz()
                
            }
            else {
                // Could not download questions
                self.numberOfRestarts = 1
                self.downloadQuestions()
            }
        }
    }
    
    @IBAction func optionButtonPressed(_ sender: UIButton) {
        //If answerSubmitted == false, enter loop - Just for clarification when im reading
        if !answerSubmitted {
            print("*** answerSubmitted Check, should be false : \(answerSubmitted)")
            if sender == selectedOption {
                // Submit
                print("*** entered submit answer if statement")
                sender.backgroundColor = UIColor.red
                sender.tintColor = UIColor.red
                submitAnswer(answer: sender.tag)
            }
            else {
                selectedOption?.isSelected = false
                sender.isSelected = true
                selectedOption = sender
            }
        }
    }
    
    func submitAnswer(answer: Int) {
        
        answerSubmitted = true
        print("*** Answer submitted value: \(answer)")
        if answer == currentQuestion?.correctOption {
            // Correct
            
            playerOneNumberCorrectAnswers = playerOneNumberCorrectAnswers + 1
            
        }
        else {
            // Incorrect
        }
        
        var optionCharacter = ""
        switch answer {
        case 0:
            optionCharacter = "A"
        case 1:
            optionCharacter = "B"
        case 2:
            optionCharacter = "C"
        case 3:
            optionCharacter = "D"
        default:
            optionCharacter = "PANIC"
        }
        
        
        player1Bubble.text = optionCharacter
        player1BubbleImage.isHidden = false
        player1Bubble.isHidden = false
        
        // We want to show the users answer above their icon here & push to other users
        let submittedAnswer = String(answer)
        if let playData = submittedAnswer.data(using: .utf8) {
            do {
                try session?.send(playData, toPeers: peers, with: .reliable)
                print("*** Submit answer data sent")
            }
            catch {
                debugPrint(error)
                print("data send failed")
            }
        }
        
    }
    
    
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        //Reset all values
        numberOfRestarts += 1
        
        let restartPhrase = "Restart"
        if let playData = restartPhrase.data(using: .utf8) {
            do {
                try session?.send(playData, toPeers: peers, with: .reliable)
            }
            catch {
                debugPrint(error)
                print("data send failed")
            }
        }
        
        downloadQuestions()
    }
    
    func endGame() {
        
        restartQuizButton.isHidden = false
        countDownTimer?.invalidate()
        
        if playerOneNumberCorrectAnswers >= playerTwoNumberCorrectAnswers && playerOneNumberCorrectAnswers >= playerThreeNumberCorrectAnswers && playerOneNumberCorrectAnswers >= playerFourNumberCorrectAnswers {
            //Player one won
            
            if peers.count == 0 {
                countDownLabel.text = "You got \(playerOneNumberCorrectAnswers) points!"
               
            }
            else {
                countDownLabel.text = "You won!"
            }
        }
        else if playerTwoNumberCorrectAnswers >= playerOneNumberCorrectAnswers && playerTwoNumberCorrectAnswers >= playerThreeNumberCorrectAnswers && playerTwoNumberCorrectAnswers >= playerFourNumberCorrectAnswers {
            if let playerTwoName = player2Name.text {
                countDownLabel.text = "\(playerTwoName) won!"
            }
        }
        else if playerThreeNumberCorrectAnswers >= playerOneNumberCorrectAnswers && playerThreeNumberCorrectAnswers >= playerTwoNumberCorrectAnswers && playerThreeNumberCorrectAnswers >= playerFourNumberCorrectAnswers{
            if let playerThreeName = player3Name.text {
                countDownLabel.text = "\(playerThreeName) won!"
            }
        }
        else if playerFourNumberCorrectAnswers >= playerOneNumberCorrectAnswers && playerFourNumberCorrectAnswers >= playerTwoNumberCorrectAnswers && playerFourNumberCorrectAnswers >= playerThreeNumberCorrectAnswers{
            if let playerFourName = player4Name.text {
                countDownLabel.text = "\(playerFourName) won!"
            }
        }
        
        
    }
    
    func displayNextQuestion() {
        if questions.isEmpty {
            endGame()
            return
        }
        answerSubmitted = false
        timeRemaining = 13
        selectedOption?.isSelected = false
        selectedOption = nil
        currentQuestion = questions.popLast()
        print("*** number of questions remaining \(questions.count)")
        questionLabel.text = currentQuestion?.questionSentence
        option1Button.backgroundColor = UIColor.white
        option2Button.backgroundColor = UIColor.white
        option3Button.backgroundColor = UIColor.white
        option4Button.backgroundColor = UIColor.white
        option1Button.tintColor = UIColor.blue
        option2Button.tintColor = UIColor.blue
        option3Button.tintColor = UIColor.blue
        option4Button.tintColor = UIColor.blue
        option1Button.setTitle(currentQuestion?.options[0], for: .normal)
        option2Button.setTitle(currentQuestion?.options[1], for: .normal)
        option3Button.setTitle(currentQuestion?.options[2], for: .normal)
        option4Button.setTitle(currentQuestion?.options[3], for: .normal)
        
        //Hide player bubbles
        self.player1Bubble.text = ""
        self.player1Bubble.isHidden = true
        self.player1BubbleImage.isHidden = true
        self.player2Bubble.text = ""
        self.player2Bubble.isHidden = true
        self.player2BubbleImage.isHidden = true
        self.player3Bubble.text = ""
        self.player3Bubble.isHidden = true
        self.player3BubbleImage.isHidden = true
        self.player4Bubble.text = ""
        self.player4Bubble.isHidden = true
        self.player4BubbleImage.isHidden = true
        
        if let currentQuestionNumber = currentQuestion?.number {
            questionCountLabel.text = "Question \(currentQuestionNumber)/\(totalNumberOfQuestions)"
        }
        
    }
    
    func configurePlayers() {
        player1Name.text = "Me"
        player1Icon.alpha = 1
        player1Icon.tintColor = UIColor.yellow
        
        for i in 0..<peers.count {
            let peerId = peers[i]
            switch i {
            case 0:
                let index = peerId.displayName.index(peerId.displayName.startIndex, offsetBy: 4)
                player2Name.text = peerId.displayName.substring(to: index)
                player2Icon.alpha = 1
                player2Icon.tintColor = UIColor.green
            case 1:
                let index = peerId.displayName.index(peerId.displayName.startIndex, offsetBy: 4)
                player3Name.text = peerId.displayName.substring(to: index)
                player3Icon.alpha = 1
                player3Icon.tintColor = UIColor.red
            case 2:
                let index = peerId.displayName.index(peerId.displayName.startIndex, offsetBy: 4)
                player4Name.text = peerId.displayName.substring(to: index)
                player4Icon.alpha = 1
                player4Icon.tintColor = UIColor.blue
            default:
                print("PANIC")
            }
        }
    }
    
}


extension QuizViewController: MCSessionDelegate {
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL, withError error: Error?) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
        if let receivedString = String(data: data, encoding: .utf8) {
            DispatchQueue.main.async {
                if receivedString == "Restart" {
                    self.numberOfRestarts += 1
                    self.downloadQuestions()
                    print("*** restart received")
                }
                else if let receivedNumber = Int(receivedString) {
                    //Got a question selection
                    var optionCharacter = ""
                    switch receivedNumber {
                    case 0:
                        optionCharacter = "A"
                    case 1:
                        optionCharacter = "B"
                    case 2:
                        optionCharacter = "C"
                    case 3:
                        optionCharacter = "D"
                    default:
                        optionCharacter = "PANIC"
                    }
                    
                    print("*** Answer Received")
                    
                    
                    
                    if peerID.displayName == self.player2Name.text {
                        if receivedNumber == self.currentQuestion?.correctOption {
                            self.playerTwoNumberCorrectAnswers += 1
                        }
                        self.player2Bubble.text = optionCharacter
                        self.player2BubbleImage.isHidden = false
                
                    }
                    if peerID.displayName == self.player3Name.text {
                        if receivedNumber == self.currentQuestion?.correctOption {
                            self.playerThreeNumberCorrectAnswers += 1
                        }
                        self.player3Bubble.text = optionCharacter
                        self.player3BubbleImage.isHidden = false
                        
                    }
                    if peerID.displayName == self.player3Name.text {
                        if receivedNumber == self.currentQuestion?.correctOption {
                            self.playerFourNumberCorrectAnswers += 1
                        }
                        self.player4Bubble.text = optionCharacter
                        self.player4BubbleImage.isHidden = false
                        
                    }
                    
                }
            }
        }
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
        // Called when a connected peer changes state (for example, goes offline)
        
        switch state {
        case MCSessionState.connected:
            print("Connected: \(peerID.displayName)")
            
        case MCSessionState.connecting:
            print("Connecting: \(peerID.displayName)")
            
        case MCSessionState.notConnected:
            print("Not Connected: \(peerID.displayName)")
        }
        
    }
}

//call the shuffle method if you want to sort the questions array. ex: questions.shuffle()
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

