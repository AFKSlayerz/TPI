//
//  GameScene.swift
//  School Invaders
//
//  Created by Mikel Harnisch on 09.05.18.
//  Copyright © 2018 Mikel & Co. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    
    let Voc1Eng = SKLabelNode()
    let Voc2Eng = SKLabelNode()
    let Voc3Eng = SKLabelNode()
    let Voc4Eng = SKLabelNode()
    let Error = SKLabelNode()
    let Back = SKLabelNode()
    let Student = SKSpriteNode(imageNamed: "Student.png")
    let Teacher = SKSpriteNode(imageNamed: "Teacher.png")
    let PaperPlane = SKSpriteNode(imageNamed: "PaperPlane.png")
    let PaperPlane2 = SKSpriteNode(imageNamed: "PaperPlane.png")
    let MoveRight = SKSpriteNode()
    let MoveLeft = SKSpriteNode()
    let StopMove = SKSpriteNode()
    let MoveUp = SKSpriteNode()
    var Box = SKSpriteNode(imageNamed: "WordCase")
    var BoxX = SKSpriteNode()
    let Box1 = SKSpriteNode(imageNamed: "WordCase")
    let Box2 = SKSpriteNode(imageNamed: "WordCase")
    let Box3 = SKSpriteNode(imageNamed: "WordCase")
    let Box4 = SKSpriteNode(imageNamed: "WordCase")
    let GameStared:Bool = false
    var VocWordTxT = SKLabelNode()
    var VocWordStudent = SKLabelNode()
    var MyVocWordStudent = [SKLabelNode]()
    var Test = SKLabelNode()
    var i:Int = 0
    var VocX:Int = 110
    var VocY:Int = 30
    var WordX:Int = 85
    var WordY:Int = 50
    var TeacherX:Int = 0
    var TeacherY:Int = 0
    var PaperPlaneX:Int = 0
    var PaperPlaneY:Int = 0
    var WordCase = SKSpriteNode(imageNamed: "WordCase.png")
    var VocWordStudentCase = SKSpriteNode()
    var TeacherSelected:String = ""
        // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    override func update(_ currentTime: TimeInterval) {
        let test: SKAction = SKAction.moveBy(x: 5, y: 0, duration: 5)
        PaperPlane2.run(test)
    }
    override init(size: CGSize) {
        super.init(size: size)
        
        TeacherX = Int(screenWidth) / 2
        TeacherY = Int(screenHeight) / 5
        PaperPlaneX = Int(screenWidth) / 2
        PaperPlaneY = Int(screenHeight) / 3
        let moveLeft = SKAction.moveBy(x: 900, y: 0, duration: 10)
        let sequence = SKAction.sequence([moveLeft, moveLeft.reversed()])
        
        backgroundColor = SKColor.white
        
        Student.position = CGPoint(x: 50, y: size.height / 1.1)  //The game will be built from the top-left
        Student.size = CGSize(width: 80, height: 90)  //The anchor point (top left)
        addChild(Student)
        
        PaperPlane2.position = CGPoint(x: 300, y: 300)
        PaperPlane2.size = CGSize(width: 50, height: 80)
        self.addChild(PaperPlane2)
        
        
        Student.run(SKAction.repeatForever(sequence), withKey:  "moving")

        Teacher.position = CGPoint(x: TeacherX, y: TeacherY)  //The game will be built from the top-left
        Teacher.size = CGSize(width: 80, height: 90)  //The anchor point (top left)
        addChild(Teacher)
        
        PaperPlane.position = CGPoint(x: PaperPlaneX, y: PaperPlaneY)
        PaperPlane.size = CGSize(width: 50, height: 80)
        self.addChild(PaperPlane)
        
        Back.fontSize = 24
        Back.fontColor = SKColor.black
        Back.fontName = "Arial-Bold"
        Back.text = "Retour"
        Back.position = CGPoint(x: size.width / 1.04, y: size.height / 1.035)
        addChild(Back)
        
        Box1.position = CGPoint(x: size.width / 9, y: 50)
        Box1.size = CGSize(width: 200, height: 85)
        Box1.name = "Box1"; // set the name for your sprite
        Box1.isUserInteractionEnabled = false; // userInteractionEnabled should be disabled
        self.addChild(Box1)
        Box2.position = CGPoint(x: size.width / 2.7, y: 50)
        Box2.size = CGSize(width: 200, height: 85)
        Box2.name = "Box2"; // set the name for your sprite
        Box2.isUserInteractionEnabled = false; // userInteractionEnabled should be disabled
        self.addChild(Box2)
        Box3.position = CGPoint(x: size.width / 1.6, y: 50)
        Box3.size = CGSize(width: 200, height: 85)
        Box3.name = "Box3"; // set the name for your sprite
        Box3.isUserInteractionEnabled = false; // userInteractionEnabled should be disabled
        self.addChild(Box3)
        Box4.position = CGPoint(x: size.width / 1.12, y: 50)
        Box4.size = CGSize(width: 200, height: 85)
        Box4.name = "Box4"; // set the name for your sprite
        Box4.isUserInteractionEnabled = false; // userInteractionEnabled should be disabled
        self.addChild(Box4)
        
        MoveRight.color = SKColor.white
        MoveRight.position = CGPoint(x: size.width / 0.9, y: size.height/5)
        MoveRight.size = CGSize(width: size.width/1.4, height: size.height/8)
        MoveRight.name = "MoveRight"; // set the name for your sprite
        MoveRight.isUserInteractionEnabled = false; // userInteractionEnabled should be disabled
        self.addChild(MoveRight)
        
        MoveLeft.color = SKColor.white
        MoveLeft.position = CGPoint(x: size.width / 8 , y: size.height/5)
        MoveLeft.size = CGSize(width: size.width / 4.1, height: size.height/8)
        MoveLeft.name = "MoveLeft"; // set the name for your sprite
        MoveLeft.isUserInteractionEnabled = false; // userInteractionEnabled should be disabled
        self.addChild(MoveLeft)
        
        StopMove.color = SKColor.white
        StopMove.position = CGPoint(x: size.width / 2 , y: size.height/5)
        StopMove.size = CGSize(width: size.width / 2, height: size.height/8)
        StopMove.name = "StopMove"; // set the name for your sprite
        StopMove.isUserInteractionEnabled = false; // userInteractionEnabled should be disabled
        self.addChild(StopMove)
        
        MoveUp.color = SKColor.white
        MoveUp.position = CGPoint(x: size.width / 2 , y: size.height/1.45)
        MoveUp.size = CGSize(width: size.width, height: size.height/1.2)
        MoveUp.name = "MoveUp"; // set the name for your sprite
        MoveUp.isUserInteractionEnabled = false; // userInteractionEnabled should be disabled
        self.addChild(MoveUp)
        
        /*for _ in 0...5
        {
            VocWordStudentCase = WordCase.copy() as! SKSpriteNode
            VocWordStudentCase.size = CGSize(width: 150, height: 75)
            VocWordStudentCase.position = CGPoint(x: WordX , y: WordY)
            addChild(VocWordStudentCase)
            WordX += 170
        }*/
        for vocid in VocProvider().VocWords[3]{
            if ChosenVoc == Int(vocid)
            {
                var line = ""
                VocWordStudent = VocWordTxT.copy() as! SKLabelNode
                line += String(VocProvider().VocWords[1][i])
                line += " "
                VocWordStudent.zPosition = 1
                VocWordStudent.fontName = "Arial-Bold"
                VocWordStudent.fontSize = 50
                VocWordStudent.fontColor = SKColor.black
                VocWordStudent.text = line
                VocWordStudent.position = CGPoint(x: VocX , y: VocY)
                MyVocWordStudent.append(VocWordStudent)
                addChild(VocWordStudent)
                VocX = VocX + 270
            }
            i+=1
        }
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            var TeacherPos:Int = Int(Teacher.position.x)
            let moveLeft: SKAction = SKAction.moveBy(x: -1, y: 0, duration: 5)
            let moveRight: SKAction = SKAction.moveBy(x: 1, y: 0, duration: 5)
            let moveUp: SKAction = SKAction.moveBy(x: 0, y: 600, duration: 5)
            if let name = touchedNode.name {
                
                while  TeacherX > 80 {
                    if(name == "MoveLeft") {
                        
                        Teacher.run(moveLeft)
                        PaperPlane.run(moveLeft)
                        TeacherX = TeacherX - 1

                        print("TP", Teacher.position.x)
                        print(TeacherX)
                    } else {
                        print("TP", Teacher.position.x)
                        print(TeacherX)
                        break;
                    }
                    
                }
                while TeacherX < 920 {
                    if(name == "MoveRight") {
                        

                        TeacherX += 1
                        Teacher.run(moveRight)
                        PaperPlane.run(moveRight)
                        
                        print("TP", Teacher.position.x)
                        print(TeacherX)
                    } else {
                        
                        print("TP", Teacher.position.x)
                        print(TeacherX)
                        break;
                    }
                }
                if(name == "MoveUp")
                {
                    PaperPlane.removeAllActions()
                    Teacher.removeAllActions()
                    PaperPlane.run(moveUp)
                   
                    self.PaperPlane.run(moveUp)
                    TeacherX = Int(self.Teacher.position.x)
                    
                }
                if name == "StopMove"
                {
                    Teacher.removeAllActions()
                    PaperPlane.removeAllActions()
                    TeacherX = Int(Teacher.position.x)
                }else{
                    break;
                }
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        for word in MyVocWordStudent {
            if word.contains(touchLocation){
                TeacherSelected = word.text!
                Test.fontSize = 24
                Test.fontColor = SKColor.black
                Test.fontName = "Arial-Bold"
                Test.text = TeacherSelected
                Test.position = CGPoint(x: size.width / 2, y: size.height / 2)
                addChild(Test)
            }
        }
        if Back.contains(touchLocation) {
            flag = 0
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let menuScene = MenuScene(size: self.size)
            self.view?.presentScene(menuScene, transition: reveal)
        }
    }
}
