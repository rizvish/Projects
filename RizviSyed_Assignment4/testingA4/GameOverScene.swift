import UIKit
import SpriteKit

var emptyArray: [Int] = []

class GameOverScene: SKScene {
    
    
    let gameOverLabel = SKLabelNode(fontNamed: "Chalkduster")
    let yourScoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    let play1 = SKLabelNode(fontNamed: "Chalkduster")

    init(size: CGSize, won: Bool) {
        super.init(size: size)
     
        for i in (0..<arrayScoresNames.arraySave.count)
        {
            
            emptyArray.append(arrayScoresNames.arraySave[i].scoresStruct)
            yourScoreLabel.text = "Your Score: \(arrayScoresNames.arraySave[i].scoresStruct!)"

            if emptyArray.count > 3
            {
                emptyArray.popLast()
            }
        }
        gameOverLabel.text = "HighScores: \(emptyArray)"
        
        play1.text = "Click to play again"
        
        gameOverLabel.fontSize = 20
        gameOverLabel.position = CGPoint(x: size.width/2, y: size.height/2)
        self.addChild(gameOverLabel)
        
        yourScoreLabel.position = CGPoint(x: size.width/2, y: size.height/2 + 100)
        yourScoreLabel.fontSize = 20
        self.addChild(yourScoreLabel)

        play1.fontSize = 20
        play1.position = CGPoint(x: size.width/2, y: size.height/2 - 100)
        self.addChild(play1)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func goToGameScene(){
        let gameScene = GameScene(fileNamed: "GameScene")

        let transition = SKTransition.fade(withDuration: 1.0)
        gameScene?.scaleMode = .aspectFill
        self.view!.presentScene(gameScene!, transition: transition)
    }
    override func didMove(to view: SKView) {
    

        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(GameOverScene.goToGameScene))
        
        gestureRecognizer1.numberOfTapsRequired = 1
        if view != nil
        {
            view.addGestureRecognizer(gestureRecognizer1)
        }
        else
        {
            NSLog("View is nil")
        }
    }

    

    
}
