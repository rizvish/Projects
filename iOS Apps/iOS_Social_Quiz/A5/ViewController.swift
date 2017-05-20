//
//  ViewController.swift
//  A5
//
//  Created by Syed Hyder Rizvi on 4/23/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import MultipeerConnectivity
import UIKit

class ViewController: UIViewController, MCBrowserViewControllerDelegate, MCSessionDelegate {

    var session: MCSession!
    var peerID: MCPeerID!
    var peers = [MCPeerID]()
    
    var browser: MCBrowserViewController!
    var assistant: MCAdvertiserAssistant!
    @IBOutlet weak var gameModeSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.peerID = MCPeerID(displayName: UIDevice.current.name)
        self.session = MCSession(peer: peerID)
        self.browser = MCBrowserViewController(serviceType: "chat", session: session)
        self.assistant = MCAdvertiserAssistant(serviceType: "chat", discoveryInfo: nil, session: session)

        assistant.start()
        session.delegate = self
        browser.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func connect(_ sender: Any) {
        present(browser, animated: true, completion: nil)

    }
    @IBAction func gameModeSegmentControlChanged(_ sender: UISegmentedControl) {
    }
    @IBAction func startQuizButtonPressed(_ sender: Any) {
        if gameModeSegmentControl.selectedSegmentIndex == 0 {
            //Singleplayer mode
            peers = [MCPeerID]()
            self.showQuiz()
        }
        else {
            //Multiplayer mode
            peers = browser.session.connectedPeers
            if peers.count > 0 && peers.count < 4 {
                //Good to continue
                let playString = "Play"
                if let playData = playString.data(using: .utf8) {
                    do {
                        try session.send(playData, toPeers: peers, with: .reliable)
                        self.showQuiz()
                    }
                    catch {
                        debugPrint(error)
                        print("data send failed")
                    }
                }
            }
            else
            {
                let alert = UIAlertController(title: "\(peers.count) Connections", message: "To begin Multiplayer, peer connections must have at least 1 or up to 3 connections.", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        // Called when the browser view controller is dismissed
        dismiss(animated: true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        // Called when the browser view controller is cancelled
        dismiss(animated: true, completion: nil)
    }

    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL, withError error: Error?) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
        if let receivedString = String(data: data, encoding: .utf8) {
            DispatchQueue.main.async {
                if receivedString == "Play" {
                    self.peers = self.browser.session.connectedPeers
                    self.showQuiz()
                }
                //print("YAY!! i got something \(receivedString)")
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
    
    func showQuiz() {
        if let quizVC = storyboard?.instantiateViewController(withIdentifier: "quiz") as? QuizViewController {
            quizVC.peers = peers
            quizVC.session = session
            navigationController?.pushViewController(quizVC, animated: true)
        }
    }



}

