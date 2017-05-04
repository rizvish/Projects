//
//  GameScene.swift
//  testingA4
//
//  Created by Syed Hyder Rizvi on 4/12/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene, SKPhysicsContactDelegate {

    
    var numberOfStars: Int = 0
    var caveman = SKSpriteNode(imageNamed: "caveman")
    var dino4 = SKSpriteNode(imageNamed: "dino4")
    var dino3 = SKSpriteNode(imageNamed: "dino3")
    var dino2 = SKSpriteNode(imageNamed: "dino2")
    var dino1 = SKSpriteNode(imageNamed: "dino1")
    var block = SKSpriteNode(imageNamed: "block")
    let rock = SKSpriteNode(imageNamed: "rock")
    var food = SKSpriteNode(imageNamed: "food")
    var water = SKSpriteNode(imageNamed: "water")
    var starPoint1 = SKSpriteNode (imageNamed: "starPoint")
    var fireBall = SKSpriteNode(imageNamed: "fire")
    var fire1: SKSpriteNode! = nil
    var rock1: SKSpriteNode! = nil

    var spawn1 = SKSpriteNode(imageNamed: "block")
    var spawn2 = SKSpriteNode(imageNamed: "block")
    var spawn3 = SKSpriteNode(imageNamed: "block")
    var spawn4 = SKSpriteNode(imageNamed: "block")
    var spawn5 = SKSpriteNode(imageNamed: "block")
    var spawn6 = SKSpriteNode(imageNamed: "block")
    var spawn7 = SKSpriteNode(imageNamed: "block")
    var spawn8 = SKSpriteNode(imageNamed: "block")
    var spawn9 = SKSpriteNode(imageNamed: "block")
    var spawn10 = SKSpriteNode(imageNamed: "block")
    var spawn11 = SKSpriteNode(imageNamed: "block")
    var spawn12 = SKSpriteNode(imageNamed: "block")
    var spawn13 = SKSpriteNode(imageNamed: "block")
    var spawn14 = SKSpriteNode(imageNamed: "block")
    var spawn15 = SKSpriteNode(imageNamed: "block")
    
    var randomArrayX = [-324.396, -265.243, -222.822, -182.342, -144.314, -107.822, -68.568, -31.154, 6.259, 45.513, 84.767, 123.435, 163.161, 201.944, 241.198, 279.17]
    var randomArrayY = [111.158, 79.187, 47.216, 15.244, 82.948, 18.948, -26.16, -55.9, -87.87, -119.842,-151.813, -45.052, -109.052, -162.359]
    
    var x = 1

    var health: Int = 300
    var gravityTime: Int = 1000
    var life: Int = 1
    
    var highScores: [Int]!
    
    var timerCount = Timer()
    var timerCount1 = Timer()
    var timerCount2 = Timer()
    var timerCount3 = Timer()
    var timerCount4 = Timer()
    var timerCount5 = Timer()


    var sound = SKAction.playSoundFileNamed("bite.wav", waitForCompletion: false)
    var sound1 = SKAction.playSoundFileNamed("death.wav", waitForCompletion: false)
    
    var sound2 = SKAction.playSoundFileNamed("cheer.mp3", waitForCompletion: false)
    var sound3 = SKAction.playSoundFileNamed("eating.mp3", waitForCompletion: false)
    
    var topMessages: SKLabelNode? = nil
    var starLabel: SKLabelNode? = nil
    var rockLabel: SKLabelNode? = nil
    var heartLabel: SKLabelNode? = nil
    var energyLabel: SKLabelNode? = nil
    var gravityLabel: SKLabelNode? = nil

    var right = SKAction.moveBy(x: 590, y: 0, duration: 6.5)
    var left = SKAction.moveBy(x: -590, y: 0, duration: 6.5)
    var up = SKAction.moveBy(x: 0, y: 550, duration: 6.5)
    var down = SKAction.moveBy(x: 0, y: -400, duration: 6.5)
    
    var arrayActions: [SKAction]?
    
    var dino4Left = SKAction.moveBy(x: -590, y: 0, duration: 6.4)
    var dino4Right = SKAction.moveBy(x: 590, y: 0, duration: 6.4)
    var dino4Up = SKAction.moveBy(x: 0, y: 400, duration: 6.4)
    var dino4Down = SKAction.moveBy(x: 0, y: -400, duration: 16.4)
    var dino2Left = SKAction.moveBy(x: -590, y: 0, duration: 5.5)
    var dino2Right = SKAction.moveBy(x: 590, y: 0, duration: 5.5)
    var dino1Up = SKAction.moveBy(x: 0, y: 300, duration: 6.0)
    var dino1Down = SKAction.moveBy(x: 0, y: -300, duration: 6.0)
    
    var numberOfRocks: Int = 10
    var numberOfSpawns: Int = 14
    var isTrue = true

    
    var randomGravity = [41.0, 42.0, 43.0, 44.0, 46.0, 47.0, 48.0, 49.0, 51.0, 52.0, 53.0 ,54.0, 56.0, 57.0, 58.0, 59.0]
    
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
       
        randomGravity.shuffle()

        let backgroundMusic = SKAudioNode(fileNamed: "marimba.mp3")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
        
        var arrayDino3Seq = [dino4Left, dino4Right, dino4Up,dino4Down]
        
        arrayDino3Seq.shuffle()
        
        let sequenceDino4 = SKAction.sequence([dino4Left, dino4Right])
        
        let repeatForeverDino4 = SKAction.repeatForever(sequenceDino4)
        
        
        let sequenceDino3 = SKAction.sequence(arrayDino3Seq)
        let repeatForeverDino3 = SKAction.repeatForever(sequenceDino3)
        
        let invertDino1 = dino1.xScale * -1
        
        let actionSK1 = SKAction.scaleX(by: invertDino1, y: invertDino1, duration: 1)
        
    
        let sequenceDino1 = SKAction.sequence([dino1Up, actionSK1, dino1Down, actionSK1])
         let repeatForeverDino1 = SKAction.repeatForever(sequenceDino1)
        
        let invertDino2 = dino2.yScale * -1
        
        let actionSK2 = SKAction.scaleX(by: invertDino2, y: invertDino2, duration: 1)
        
        let sequenceDino2 = SKAction.sequence([dino2Left, actionSK2, dino2Right, actionSK2])
        let repeatForeverDino2 = SKAction.repeatForever(sequenceDino2)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        caveman = self.childNode(withName: "caveman") as! SKSpriteNode
        dino1 = self.childNode(withName: "dino1") as! SKSpriteNode
        dino2 = self.childNode(withName: "dino2") as! SKSpriteNode
        dino3 = self.childNode(withName: "dino3") as! SKSpriteNode
        dino4 = self.childNode(withName: "dino4") as! SKSpriteNode
        starPoint1 = self.childNode(withName: "starPoints") as! SKSpriteNode
        water = self.childNode(withName: "water") as! SKSpriteNode
        food = self.childNode(withName: "food") as! SKSpriteNode
        fireBall = self.childNode(withName: "fireBall") as! SKSpriteNode
        spawn1 = self.childNode(withName: "spawn1") as! SKSpriteNode
        spawn2 = self.childNode(withName: "spawn2") as! SKSpriteNode
        spawn3 = self.childNode(withName: "spawn3") as! SKSpriteNode
        spawn4 = self.childNode(withName: "spawn4") as! SKSpriteNode
        spawn5 = self.childNode(withName: "spawn5") as! SKSpriteNode
        spawn6 = self.childNode(withName: "spawn6") as! SKSpriteNode
        spawn7 = self.childNode(withName: "spawn7") as! SKSpriteNode
        spawn8 = self.childNode(withName: "spawn8") as! SKSpriteNode
        spawn9 = self.childNode(withName: "spawn9") as! SKSpriteNode
        spawn10 = self.childNode(withName: "spawn10") as! SKSpriteNode
        spawn11 = self.childNode(withName: "spawn11") as! SKSpriteNode
        spawn12 = self.childNode(withName: "spawn12") as! SKSpriteNode
        spawn13 = self.childNode(withName: "spawn13") as! SKSpriteNode
        spawn14 = self.childNode(withName: "spawn14") as! SKSpriteNode
        spawn15 = self.childNode(withName: "spawn15") as! SKSpriteNode
        
          rock.size = CGSize(width: 10, height: 10)
        rock.position = CGPoint(x: caveman.position.x + 2, y: caveman.position.y)
        rock.physicsBody?.contactTestBitMask = 1
        addChild(rock)
        
        fireBall.position = CGPoint(x: dino4.position.x, y: dino4.position.y - 10)
        fireBall.texture = SKTexture(imageNamed: "fire")
        
        topMessages = self.childNode(withName: "myLabel") as! SKLabelNode?
        starLabel = self.childNode(withName: "star") as! SKLabelNode?
        rockLabel = self.childNode(withName: "rock") as! SKLabelNode?
        heartLabel = self.childNode(withName: "heart") as! SKLabelNode?
        energyLabel = self.childNode(withName: "energy") as! SKLabelNode?
        gravityLabel = self.childNode(withName: "gravity") as! SKLabelNode?
        
        gravityLabel?.fontColor = UIColor.black
        
        topMessages?.text = "Welcome to Maze Game"
        
        starLabel?.text = String(numberOfStars)
        rockLabel?.text = "10"
        heartLabel?.text = "1"
        energyLabel?.text = String(health)
        gravityLabel?.text = "Gravity is off"
        
        dino1.position = CGPoint(x: water.position.x, y: water.position.y + 50)

        randomArrayY.shuffle()
        
        dino2.position = CGPoint(x: 274.451, y: randomArrayY[0])
    
        
        dino1.run(repeatForeverDino1)
        dino2.run(repeatForeverDino2)
        dino4.run(repeatForeverDino4)
        dino3.run(repeatForeverDino3)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view?.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view?.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view?.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view?.addGestureRecognizer(swipeDown)
        
        timerCount = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameScene.counter), userInfo: nil, repeats: true)
        
        timerCount1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameScene.spawns), userInfo: nil, repeats: true)
        x = 1
        timerCount2 = Timer.scheduledTimer(timeInterval: randomGravity[0], target: self, selector: #selector(GameScene.gravity), userInfo: nil, repeats: true)
        
        timerCount3 = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(GameScene.addRocks), userInfo: nil, repeats: true)
        
        timerCount4 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(GameScene.fireShoot), userInfo: nil, repeats: true)
        
        timerCount4 = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(GameScene.turnOffGravity), userInfo: nil, repeats: true)
    
        randomArrayX.shuffle()
        randomArrayY.shuffle()

        food.position = CGPoint(x: randomArrayX[1], y: randomArrayY[4])
        
        starPoint1.position = CGPoint(x: randomArrayX[2], y: randomArrayY[3])

    }
    
    func turnOffGravity()
    {
        if health != 0
        {
        gravityLabel?.text = "Gravity is Off!"
        caveman.physicsBody?.affectedByGravity = false
        caveman.physicsBody?.collisionBitMask = 0
        }
        else
        {
        timerCount5.invalidate()
        }
    }
    
    func fireShoot(){
        
        if health != 0
        {
        fire1 = SKSpriteNode(imageNamed: "fire")
        fire1.name = "rock"
        fire1.size = CGSize(width: 35, height: 35)
        fire1.position = dino4.position
        fire1.zPosition = 12
        fire1.physicsBody = SKPhysicsBody(rectangleOf: fire1.size)
        fire1.physicsBody!.affectedByGravity = false
        fire1.physicsBody!.categoryBitMask = 0
        fire1.physicsBody!.collisionBitMask = 0
        fire1.physicsBody!.contactTestBitMask = 0
        self.addChild(fire1)
        
        let moveFire1 = SKAction.moveTo(y: (self.size.height  + fire1.size.height) * -1, duration: 10)
        let deleteFire1 = SKAction.removeFromParent()
        let fireSequence = SKAction.sequence([moveFire1, deleteFire1])
        fire1.run(fireSequence)
        }
        else
        {
            timerCount4.invalidate()
        }
    }
    
    func gravity(){
        
        if health > 0
        {
       
        gravityLabel?.text = "Gravity is On!"
        caveman.physicsBody?.affectedByGravity = true
        caveman.physicsBody?.collisionBitMask = 1

        
        }
        else
        {
            timerCount2.invalidate()
        }

    }
    
    
    func newPlace() {
        randomArrayX.shuffle()
        randomArrayY.shuffle()
        starPoint1.position = CGPoint(x: randomArrayX[0], y: randomArrayY[0])
    }
    func didBegin(_ contact: SKPhysicsContact) {
 
        
        if contact.bodyA.node?.name == "dino3" || contact.bodyB.node?.name == "dino3" {
            
            print("caveman in contact with dino3")
            
            run(sound)
            
            health -= 100
            
            energyLabel?.text = String(health)
            
            topMessages?.text = "Ouch! Hit by Dino3"
            
        }
        else if contact.bodyA.node?.name == "dino2" || contact.bodyB.node?.name == "dino2" {
            
            print("caveman in contact with dino3")
            
            run(sound)
            
            health -= 60
            
            energyLabel?.text = String(health)
            
            topMessages?.text = "Ouch! Hit by Dino2!"
            
        }
            
        else if contact.bodyA.node?.name == "dino1" || contact.bodyB.node?.name == "dino1" {
            
            print("caveman in contact with dino1")
            
            run(sound)
            
            health -= 80
            
            energyLabel?.text = String(health)
            
            topMessages?.text = "Ouch! Hit by Dino1!"
        }

        else if contact.bodyA.node?.name == "topBarrier" || contact.bodyB.node?.name == "topBarrier" {
            print("caveman in contact with topBarrier ")
            
            caveman.removeAllActions()
            
            
            
        }
        else if contact.bodyA.node?.name == "bottomBarrier" || contact.bodyB.node?.name == "bottomBarrier" {
            print("caveman in contact with bottomBarrier ")
            
            caveman.removeAllActions()
    
        }
        else if contact.bodyA.node?.name == "leftBarrier" || contact.bodyB.node?.name == "leftBarrier" {
            print("caveman in contact with leftBarrier ")
            
            caveman.removeAllActions()
            
        }
        
        else if contact.bodyA.node?.name == "rightBarrier" || contact.bodyB.node?.name == "rightBarrier" {
            print("caveman in contact with rightBarrier ")
            
            caveman.removeAllActions()
            
        }
            
        else if contact.bodyA.node?.name == "water" || contact.bodyB.node?.name == "water" {
            print("caveman in contact with water ")
            
            health = 0
            
            topMessages?.text = "You drowned."
        }
            
        else if contact.bodyA.node?.name == "starPoints" || contact.bodyB.node?.name == "starPoints" {
            print("caveman in contact with star")

            let place = SKAction.run(newPlace)
            starPoint1.run(place)
            
            numberOfStars += 1
            
            topMessages?.text = "Your scored a star! Total Stars: \(numberOfStars)"
            starLabel?.text = String(numberOfStars)
            
            run(sound2)

        }
            
        else if contact.bodyA.node?.name == "food" || contact.bodyB.node?.name == "food" {
            print("caveman in contact with star ")
            
            if health < 251 {
                health += 50
                energyLabel?.text = String(health)
            }
            else if health > 251 && health < 261
            {
                health += 40
            }
            else if health > 261 && health < 271
            {
                health += 30
            }
            else if health > 271 && health < 281
            {
                health += 20
            }
            else if health > 281 && health < 291
            {
                health += 10
            }
            else
            {
                print("hello")
            }
            topMessages?.text = "You gained energy!"
            
            let placeFood = SKAction.run(newFood)
            food.run(sound3)
            food.run(placeFood)
        }
            
        else if contact.bodyA.node?.name == "spawn1" || contact.bodyB.node?.name == "spawn1" {
            print("caveman in contact with spawn1 ")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn2" || contact.bodyB.node?.name == "spawn2" {
            print("caveman in contact with spawn2")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn3" || contact.bodyB.node?.name == "spawn3" {
            print("caveman in contact with spawn3")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn4" || contact.bodyB.node?.name == "spawn4" {
            print("caveman in contact with spawn4")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn5" || contact.bodyB.node?.name == "spawn5" {
            print("caveman in contact with spawn5")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn6" || contact.bodyB.node?.name == "spawn6" {
            print("caveman in contact with spawn6")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn7" || contact.bodyB.node?.name == "spawn7" {
            print("caveman in contact with spawn7")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn8" || contact.bodyB.node?.name == "spawn8" {
            print("caveman in contact with spawn8")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn9" || contact.bodyB.node?.name == "spawn9" {
            print("caveman in contact with spawn9")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn10" || contact.bodyB.node?.name == "spawn10" {
            print("caveman in contact with spawn10 ")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn11" || contact.bodyB.node?.name == "spawn11" {
            print("caveman in contact with spawn11 ")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn12" || contact.bodyB.node?.name == "spawn12" {
            print("caveman in contact with spawn12 ")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn13" || contact.bodyB.node?.name == "spawn13" {
            print("caveman in contact with spawn13 ")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn14" || contact.bodyB.node?.name == "spawn14" {
            print("caveman in contact with spawn14 ")
            caveman.removeAllActions()
            
        }
        else if contact.bodyA.node?.name == "spawn15" || contact.bodyB.node?.name == "spawn15" {
            print("caveman in contact with spawn15 ")
            caveman.removeAllActions()
            
        }
    }
    
    func newFood(){
    
    randomArrayX.shuffle()
    randomArrayY.shuffle()
    food.position = CGPoint(x: randomArrayX[0], y: randomArrayY[0])

    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        let invertedCaveX = caveman.xScale * -1

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.right:
                caveman.run(right)
                caveman.xScale = invertedCaveX
                print("Swiped right")
                
            case UISwipeGestureRecognizerDirection.down:
                caveman.run(down)
                caveman.xScale = invertedCaveX

                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                caveman.run(left)
                caveman.xScale = invertedCaveX
                print("Swiped left")
                
            case UISwipeGestureRecognizerDirection.up:
                caveman.run(up)
                caveman.xScale = invertedCaveX
                print("Swiped up")
                
            default:
                break
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if numberOfRocks > 0 {
            
            rock1 = SKSpriteNode(imageNamed: "rock")
            rock1.name = "rock"
            rock1.size = CGSize(width: 15, height: 15)
            rock1.position = caveman.position
            rock1.zPosition = 12
            rock1.physicsBody = SKPhysicsBody(rectangleOf: rock1.size)
            rock1.physicsBody!.affectedByGravity = false
            rock1.physicsBody!.categoryBitMask = 0
            rock1.physicsBody!.collisionBitMask = 0
            rock1.physicsBody!.contactTestBitMask = 0
            self.addChild(rock1)
            
            let moveRock1 = SKAction.moveTo(x: self.size.width, duration: 5)
            
            let deleteRock1 = SKAction.removeFromParent()
            let rockSequence = SKAction.sequence([moveRock1, deleteRock1])
            rock1.run(rockSequence)
            numberOfRocks -= 1
            rockLabel?.text = String(numberOfRocks)
            
        }
        else
        {
            topMessages?.text = "Out of Rocks. Wait 30 seconds"

    }
    }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//     
//            if numberOfRocks > 0 {
//         
//            rock1 = SKSpriteNode(imageNamed: "rock")
//            rock1.name = "rock"
//            rock1.size = CGSize(width: 15, height: 15)
//            rock1.position = caveman.position
//            rock1.zPosition = 12
//            rock1.physicsBody = SKPhysicsBody(rectangleOf: rock1.size)
//            rock1.physicsBody!.affectedByGravity = false
//            rock1.physicsBody!.categoryBitMask = 0
//            rock1.physicsBody!.collisionBitMask = 0
//            rock1.physicsBody!.contactTestBitMask = 0
//            self.addChild(rock1)
//            
//            let moveRock1 = SKAction.moveTo(x: self.size.width, duration: 5)
//    
//            let deleteRock1 = SKAction.removeFromParent()
//            let rockSequence = SKAction.sequence([moveRock1, deleteRock1])
//            rock1.run(rockSequence)
//            numberOfRocks -= 1
//            rockLabel?.text = String(numberOfRocks)
//            
//            }
//            else
//            {
//            topMessages?.text = "Out of Rocks. Wait 30 seconds"
//
//        }
//    }
    
    func addRocks()
    {
        if numberOfRocks <= 20{
        numberOfRocks += 20 - numberOfRocks
        }
    }


    override func update(_ currentTime: TimeInterval) {

        fireBall.position = CGPoint(x: dino4.position.x, y: dino4.position.y - 10)
        rock.position = CGPoint(x: caveman.position.x + 2, y: caveman.position.y)
    }

    func counter()
    {
        health -= 1
        energyLabel?.text = String(health)
        
        
        if(health <= 0)
        {
            heartLabel?.text = "0"
            arrayScoresNames.arraySave.append(arrayScoresNames.highScoresSave(scoresStruct: numberOfStars))
            
            timerCount.invalidate()
            // transition to game over scene
            let flipTransition = SKTransition.doorsCloseHorizontal(withDuration: 1.0)
            let gameOverScene = GameOverScene(size: self.size, won: true)
            gameOverScene.scaleMode = .aspectFill
            
            self.view?.presentScene(gameOverScene, transition: flipTransition)
            run(sound1)
            
        }
    }
    
    func spawns()
    {
        if isTrue == true
        {
            topMessages?.text = "Blocks Spawning!"
            isTrue = false
        }
        
        if numberOfSpawns != 0 {
         
            if numberOfSpawns == 15 {
                spawn1.position = CGPoint(x: randomArrayX[0], y: randomArrayY[0])
            
            }
            else if numberOfSpawns == 14 {
                spawn2.position = CGPoint(x: randomArrayX[1], y: randomArrayY[1])
            }
            else if numberOfSpawns == 13 {
                spawn3.position = CGPoint(x: randomArrayX[2], y: randomArrayY[2])
            }
            else if numberOfSpawns == 12 {
                spawn4.position = CGPoint(x: randomArrayX[3], y: randomArrayY[3])
                
            }
            else if numberOfSpawns == 11 {
                spawn5.position = CGPoint(x: randomArrayX[4], y: randomArrayY[4])
                
            }
            else if numberOfSpawns == 10 {
                spawn6.position = CGPoint(x: randomArrayX[5], y: randomArrayY[5])
                
            }
            else if numberOfSpawns == 9 {
                spawn7.position = CGPoint(x: randomArrayX[4], y: randomArrayY[1])
                
            }
            else if numberOfSpawns == 8 {
                spawn8.position = CGPoint(x: randomArrayX[6], y: randomArrayY[6])
                
            }
            else if numberOfSpawns == 7 {
                spawn9.position = CGPoint(x: randomArrayX[7], y: randomArrayY[7])
                
            }
            else if numberOfSpawns == 6 {
                spawn10.position = CGPoint(x: randomArrayX[8], y: randomArrayY[8])
                
            }
            else if numberOfSpawns == 5 {
                spawn11.position = CGPoint(x: randomArrayX[9], y: randomArrayY[9])
                
            }
            else if numberOfSpawns == 4 {
                spawn12.position = CGPoint(x: randomArrayX[10], y: randomArrayY[10])
                
            }
            else if numberOfSpawns == 3 {
                spawn13.position = CGPoint(x: randomArrayX[11], y: randomArrayY[11])
                
            }
            else if numberOfSpawns == 2 {
                spawn14.position = CGPoint(x: randomArrayX[12], y: randomArrayY[12])
                
            }
            else if numberOfSpawns == 1 {
                spawn15.position = CGPoint(x: randomArrayX[13], y: randomArrayY[13])
                
            }
            numberOfSpawns -= 1
            
        }
        else
        {
        
        timerCount1.invalidate()
        topMessages?.text = "Blocks have stopped spawning."

        }
        
        
    }
    enum PhysicsCategory : UInt32 {
        case dino3 = 4
        case water = 3
        case block = 2
        case caveman = 1
        case starPoint = 5
        case none = 0
        
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

