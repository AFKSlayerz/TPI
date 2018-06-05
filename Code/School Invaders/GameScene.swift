//
//  GameScene.swift
//  School Invaders
//
//  Created by Mikel Harnisch on 09.05.18.
//  Copyright © 2018 Mikel & Co. All rights reserved.
//

import UIKit
import SpriteKit
var StudentNum = 1

struct CollisionCategories{
    static let Student : UInt32 = 0x1 << 0          //1
    static let Teacher: UInt32 = 0x1 << 1       //2
    static let PaperPlane: UInt32 = 0x1 << 2         //4
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var SetupPP = 0
    var canFire = false
    let RowsOfStudent = 2
    var StudentSPeed = 2
    var abcSpeed = 2
    var BoxSpeed = 2
    var OnOff = 0
    
    var CanWord = 0
    let leftBounds = CGFloat(30)
    var rightBounds = CGFloat(0)
    let teacher:Teacher = Teacher()
    let paperPlane:PaperPlane = PaperPlane()
    
    let Background = SKSpriteNode(imageNamed: "Background.jpg")
    let Back = SKLabelNode()
    let MoveRight = SKSpriteNode()
    let MoveLeft = SKSpriteNode()
    let StopMove = SKSpriteNode()
    let MoveUp = SKSpriteNode()
    
    var Box = SKSpriteNode(imageNamed: "WordCase")
    var BoxX = SKSpriteNode()
    var Boxes = SKSpriteNode(imageNamed: "WordCase")
    var Boxe = SKSpriteNode()
    var BoxBox = [SKSpriteNode]()
    var MyBox = [SKSpriteNode]()
    var VocWordTxT = SKLabelNode()
    var VocWordStudent = SKLabelNode()
    var MyVocWordStudent = [SKLabelNode]()
    var VocWordTeacher = SKLabelNode()
    var MyVocWordTeacher = [SKLabelNode]()
    var Test = SKLabelNode()
    var i:Int = 0
    var z:Int = 0
    var x:Int = 0
    var y:Int = 0
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
    var TeacherM = 5
    var PaperPlaneM = 0
    
    var TestTxT = SKLabelNode()
    var abc = SKLabelNode()
        // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    override func update(_ currentTime: TimeInterval) {
        let moveLeft: SKAction = SKAction.moveBy(x: -1, y: 0, duration: 0.1)
        let moveRight: SKAction = SKAction.moveBy(x: 1, y: 0, duration: 0.1)
        MoveText()
        MoveBox()
        MoveStudent()
        setupPaperPlane()
        paperPlane.position = CGPoint(x: teacher.position.x, y: teacher.position.y + 80)
        
        if PaperPlaneM == 1 && paperPlane.position.y < 600{
            ThrowPaperPlane()
        }else{
            PaperPlaneM = 0
            CanWord = 0
            switch TeacherM{
            case 0 :
                break;
            case 1:
                if  teacher.position.x > 60
                {
                    teacher.run(moveLeft)
                    paperPlane.run(moveLeft)
                }
            case 2 :
                if  teacher.position.x < 950
                {
                    teacher.run(moveRight)
                    paperPlane.run(moveRight)
                }
            default:
                break;
            }
        }
        if y == 0
        {
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let gameOver = GameOver(size: self.size)
            self.view?.presentScene(gameOver, transition: reveal)
        }
    }
    
    //Create Student on the field
    func setupStudent(){
        let StudentRow = 0;
        var StudentColumn = 0;

        for word in MyVocWordStudent {
            StudentColumn = Int(word.name!)!
            var line = ""
            var line2 = ""
            abc = TestTxT.copy() as! SKLabelNode
            line += word.text!
            line += " "
            line2 += String(VocProvider().VocWords[0][y])
            line2 += " "
            abc.fontName = "Arial-Bold"
            abc.fontSize = 25
            abc.fontColor = SKColor.black
            abc.text = line
            abc.name = "abc"
            abc.accessibilityLabel = line2
            abc.zPosition = 4
            BoxX = Box.copy() as! SKSpriteNode
            BoxX.name = "BoxX"
            BoxX.accessibilityLabel = line2
            BoxX.size = CGSize(width: 120, height: 40)
            BoxX.zPosition = 3
            let tempStudent:Student = Student()
            let StudentHalfWidth:CGFloat = tempStudent.size.width/2
            let xPositionStart:CGFloat = size.width/2 - StudentHalfWidth - (CGFloat(StudentNum) * tempStudent.size.width) + CGFloat(30)
            tempStudent.position = CGPoint(x:xPositionStart  + ((tempStudent.size.width+CGFloat(120))*(CGFloat(Int(word.name!)!-1))), y:CGFloat(self.size.height - 80))
            abc.position = CGPoint(x:xPositionStart  + ((tempStudent.size.width+CGFloat(120))*(CGFloat(Int(word.name!)!-1))), y:CGFloat(self.size.height - 100))
            tempStudent.size = CGSize(width: 60, height: 80)
            BoxX.position = CGPoint(x:xPositionStart  + ((tempStudent.size.width+CGFloat(90))*(CGFloat(Int(word.name!)!-1))), y:CGFloat(self.size.height - 90))
            tempStudent.size = CGSize(width: 90, height: 120)
            tempStudent.StudentRow = StudentRow
            tempStudent.StudentColumn = StudentColumn
            tempStudent.zPosition = 1
            tempStudent.accessibilityLabel = line2
            MyBox.append(BoxX)
            addChild(tempStudent)
            addChild(abc)
            addChild(BoxX)
            y+=1
        }
    }
    
    //Create teacher on the field
    func setupTeacher(){
        teacher.position = CGPoint(x:TeacherX, y:TeacherY)
        teacher.size = CGSize(width: 60, height: 80)
        teacher.zPosition = 1
        addChild(teacher)
    }
    
    //Create PaperPlane on the field
    func setupPaperPlane()
    {
        if SetupPP == 1 {
            paperPlane.size = CGSize(width: 50, height: 80)
            paperPlane.position = CGPoint(x: teacher.position.x, y: teacher.position.y + 80)
            paperPlane.zPosition = 1
            self.addChild(paperPlane)
            SetupPP = 0
            print(teacher.position.x)
            print(paperPlane.position.x)
        }else{return}
    }
    
    //Move Student from left to right
    func MoveStudent(){
        var changeDirection = false
        enumerateChildNodes(withName: "Student") { node, stop in
            let student = node as! SKSpriteNode
            let StudentHalfWidth = student.size.width/2
            student.position.x -= CGFloat(self.StudentSPeed)
            if(student.position.x > self.rightBounds - StudentHalfWidth || student.position.x < self.leftBounds + StudentHalfWidth){
                changeDirection = true
            }
            
        }
        if(changeDirection == true){
            self.StudentSPeed *= -1
            self.enumerateChildNodes(withName: "Student") { node, stop in
                let student = node as! SKSpriteNode
                student.position.y -= CGFloat(46)
            }
            changeDirection = false
        }
    }
    
    //Move the Student's word form right to left
    func MoveText(){
        var changeDirection = false
        enumerateChildNodes(withName: "abc") { node, stop in
            let abc = node as! SKLabelNode
            abc.position.x -= CGFloat(self.abcSpeed)
            if(abc.position.x > self.rightBounds - 45.1 || abc.position.x < self.leftBounds + 45){
                changeDirection = true
            }
        }
        if(changeDirection == true){
            self.abcSpeed *= -1
            self.enumerateChildNodes(withName: "abc") { node, stop in
                let abc = node as! SKLabelNode
                abc.position.y -= CGFloat(46)
            }
            changeDirection = false
        }
    }
    
    //Move the Boxes containing the student's words from right to left
    func MoveBox(){
        var changeDirection = false
        enumerateChildNodes(withName: "BoxX") { node, stop in
            let BoxX = node as! SKSpriteNode
            BoxX.position.x -= CGFloat(self.BoxSpeed)
            if(BoxX.position.x > self.rightBounds - 45.1 || BoxX.position.x < self.leftBounds + 45){
                changeDirection = true
            }
        }
        if(changeDirection == true){
            self.BoxSpeed *= -1
            self.enumerateChildNodes(withName: "BoxX") { node, stop in
                let BoxX = node as! SKSpriteNode
                BoxX.position.y -= CGFloat(46)
            }
            changeDirection = false
        }
    }
    
    //Throw the PaperPlane
    func ThrowPaperPlane(){
        if canFire == false{
            return
        }else{
            canFire = false
            PaperPlaneM = 0
            let ThrowPP = SKAction.move(to: CGPoint(x:paperPlane.position.x,y: paperPlane.position.y + 600), duration: 1.0)
            let RemovePP = SKAction.removeFromParent()
            paperPlane.run(SKAction.sequence([ThrowPP,RemovePP]))
            Test.removeFromParent()
            OnOff = 0
            self.enumerateChildNodes(withName: "VocTeacher") {(node, stop) in
                if let name = node.accessibilityLabel, name.contains(String(self.paperPlane.name!)) {
                    node.isHidden = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        node.isHidden = false
                    }
                }
            }
        }
    }
    
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0,dy: 0)
        self.physicsWorld.contactDelegate = self
        backgroundColor = SKColor.black
        rightBounds = self.size.width - 30
        setupStudent()
        setupTeacher()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        /*let collision:UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
         print("Collisiaaaaaon")
        
        if collision == CollisionCategories.Student | CollisionCategories.PaperPlane{
            print("coll")
        }*/
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        //To know wich one is the first and wich one the the second body
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB

        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
            print("Collisionnnnn")

        }
        //Contact between the PaperPlane and the Student's Box
        if ((firstBody.categoryBitMask & CollisionCategories.Student != 0) &&
            (secondBody.categoryBitMask & CollisionCategories.PaperPlane != 0)){

            self.enumerateChildNodes(withName: "abc") {(node, stop) in
                let abcXRight = node.position.x + 50
                let abcXLeft = node.position.x - 50
                let difference = 720 - node.position.y
                
                if self.paperPlane.position.x > abcXLeft && self.paperPlane.position.x < abcXRight{
                    if node.accessibilityLabel == self.paperPlane.name{
                        let flip = SKAction.scaleX(to: -1, duration: 0.4)
                        
                        node.setScale(1.0)
                        
                        var RemovePP = SKAction.removeFromParent()
                        var action = SKAction.sequence([flip, RemovePP] )
                        
                        node.run(action)
                    }
                }
            }
            self.enumerateChildNodes(withName: "Student") {(node, stop) in
                let abcXRight = node.position.x + 50
                let abcXLeft = node.position.x - 50
                let difference = 720 - node.position.y
                
                if self.paperPlane.position.x > abcXLeft && self.paperPlane.position.x < abcXRight{
                    if node.accessibilityLabel == self.paperPlane.name{
                        
                        let MoveStudent1 = SKAction.move(to: CGPoint(x:node.position.x,y: node.position.y + difference), duration: 1.0)
                        let MoveStudent2 = SKAction.move(to: CGPoint(x:900,y:720), duration: 1.0)
                        let MoveStudent3 = SKAction.move(to: CGPoint(x:900,y:360), duration: 1.0)
                        let RemoveStudent = SKAction.removeFromParent()
                        node.run(SKAction.sequence([MoveStudent1,MoveStudent2,MoveStudent3,RemoveStudent]))
                        
                    }
                }
            }
            self.enumerateChildNodes(withName: "BoxX") {(node, stop) in
                let abcXRight = node.position.x + 50
                let abcXLeft = node.position.x - 50
                let difference = 720 - node.position.y
                
                if self.paperPlane.position.x > abcXLeft && self.paperPlane.position.x < abcXRight{
                    if node.accessibilityLabel == self.paperPlane.name{
                        let flip = SKAction.scaleX(to: -1, duration: 0.4)
                        
                        node.setScale(1.0)
                        
                        var RemoveBox = SKAction.removeFromParent()
                        var action = SKAction.sequence([flip, RemoveBox] )
                        
                        node.run(action)
                        self.y = self.y - 1
                    }
                }
            }
        }
        if ((firstBody.categoryBitMask & CollisionCategories.Student != 0) &&
            (secondBody.categoryBitMask & CollisionCategories.Teacher != 0)) {
            print("Student and Teacher contact")
            
        }
        
    }
    override init(size: CGSize) {
        super.init(size: size)
        
        TeacherX = Int(screenWidth) / 2
        TeacherY = Int(screenHeight) / 5
        PaperPlaneX = Int(screenWidth) / 2
        PaperPlaneY = Int(screenHeight) / 3
        
        
        
        backgroundColor = SKColor.white
        
        
        /*Teacher.position = CGPoint(x: TeacherX, y: TeacherY)  //The game will be built from the top-left
        Teacher.size = CGSize(width: 80, height: 90)  //The anchor point (top left)
        addChild(Teacher)*/
        
        Back.fontSize = 24
        Back.fontColor = SKColor.black
        Back.fontName = "Arial-Bold"
        Back.text = "Retour"
        Back.name = "Back"
        Back.zPosition = 4
        Back.position = CGPoint(x: size.width / 1.04, y: size.height / 1.035)
        addChild(Back)
        
        Background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        Background.size = CGSize(width: 1024, height: 900)
        Background.zPosition = 0
        self.addChild(Background)
        
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
        
        for vocid in VocProvider().VocWords[3]{
            if ChosenVoc == Int(vocid)
            {
                var line = ""
                VocWordStudent = VocWordTxT.copy() as! SKLabelNode
                line += String(VocProvider().VocWords[1][x])
                line += " "
                VocWordStudent.zPosition = 2
                VocWordStudent.fontName = "Arial-Bold"
                VocWordStudent.fontSize = 25
                VocWordStudent.fontColor = SKColor.black
                VocWordStudent.text = line
                VocWordStudent.name = String(x)
                MyVocWordStudent.append(VocWordStudent)
                addChild(VocWordStudent)
            }
            x+=1
        }
        
        for vocid in VocProvider().VocWords[3]{
            if ChosenVoc == Int(vocid)
            {
                var line = ""
                var line2 = ""
                VocWordTeacher = VocWordTxT.copy() as! SKLabelNode
                Boxe = Boxes.copy() as! SKSpriteNode
                line += String(VocProvider().VocWords[2][z])
                line += " "
                line2 += String(VocProvider().VocWords[0][z])
                line2 += " "
                Boxe.zPosition = 1
                Boxe.size = CGSize(width: 200, height: 85)
                Boxe.position = CGPoint(x: VocX, y: VocY + 20)
                Boxe.accessibilityLabel = "Boxe"
                Boxe.name = line2
                VocWordTeacher.zPosition = 2
                VocWordTeacher.fontName = "Arial-Bold"
                VocWordTeacher.fontSize = 30
                VocWordTeacher.fontColor = SKColor.black
                VocWordTeacher.text = line
                VocWordTeacher.accessibilityLabel = line2
                VocWordTeacher.name = "VocTeacher"
                VocWordTeacher.position = CGPoint(x: VocX , y: VocY + 10)
                BoxBox.append(Boxe)
                MyVocWordTeacher.append(VocWordTeacher)
                addChild(Boxe)
                addChild(VocWordTeacher)
                VocX = VocX + 270
            }
            z+=1
        }
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            //var TeacherPos:Int = Int(Teacher.position.x)
            if let name = touchedNode.name {
                
                switch name{
                    
                case "MoveLeft": TeacherM = 1
                    
                case "MoveRight": TeacherM = 2
                    
                case "MoveUp": if OnOff == 1{PaperPlaneM = 1}else{return}
                    
                case "StopMove": TeacherM = 0
                
                case "Back":
                    flag = 0
                    let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
                    let menuScene = MenuScene(size: self.size)
                    self.view?.presentScene(menuScene, transition: reveal)
                    
                default:
                    break;
                }
            }
            
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        for box in BoxBox
        {
            let BoxPosXR = box.position.x + 100
            let BoxPosXL = box.position.x - 100
            if box.contains(touchLocation)
            {
                if BoxPosXR > teacher.position.x && BoxPosXL < teacher.position.x
                {
                    if paperPlane.name  == box.name
                    {
                        return
                    }
                    else
                    {
                        paperPlane.name = box.name
                        paperPlane.accessibilityLabel = paperPlane.name
                        canFire = true
                        SetupPP = 1
                        Test.fontSize = 24
                        Test.fontColor = SKColor.black
                        Test.fontName = "Arial-Bold"
                        Test.text = box.name
                        Test.position = CGPoint(x: size.width / 2, y: size.height / 2)
                        Test.zPosition = 5
                        OnOff = 1
                        CanWord = 1
                        addChild(Test)
                        self.enumerateChildNodes(withName: "VocTeacher") {(node, stop) in
                            if let name = node.accessibilityLabel, name.contains(String(box.name!)) {
                                node.isHidden = true
                            }
                        }
                    }
                }
            }
        }
    }
}
