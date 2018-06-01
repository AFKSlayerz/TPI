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
    static let TeacherBullet: UInt32 = 0x1 << 2         //4
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var SetupPP = 0
    var canFire = false
    let RowsOfStudent = 2
    var StudentSPeed = 2
    var abcSpeed = 2
    var BoxSpeed = 2

    var OnOff = 0
    let leftBounds = CGFloat(30)
    var rightBounds = CGFloat(0)
    var StudentWhoCanFire:[Student] = []
    let teacher:Teacher = Teacher()
    let paperPlane:PaperPlane = PaperPlane()
    
    let Background = SKSpriteNode(imageNamed: "Background.jpg")
    let Voc1Eng = SKLabelNode()
    let Voc2Eng = SKLabelNode()
    let Voc3Eng = SKLabelNode()
    let Voc4Eng = SKLabelNode()
    let Error = SKLabelNode()
    let Back = SKLabelNode()
    let MoveRight = SKSpriteNode()
    let MoveLeft = SKSpriteNode()
    let StopMove = SKSpriteNode()
    let MoveUp = SKSpriteNode()
    
    var TemporaryStudent = SKSpriteNode()
    var MyTempStudent = [SKSpriteNode]()
    
    var Box = SKSpriteNode(imageNamed: "WordCase")
    var BoxX = SKSpriteNode()
    var Boxes = SKSpriteNode(imageNamed: "WordCase")
    var Boxe = SKSpriteNode()
    var BoxBox = [SKSpriteNode]()
    var MyBox = [SKSpriteNode]()
    let Box1 = SKSpriteNode(imageNamed: "WordCase")
    let Box2 = SKSpriteNode(imageNamed: "WordCase")
    let Box3 = SKSpriteNode(imageNamed: "WordCase")
    let Box4 = SKSpriteNode(imageNamed: "WordCase")
    let GameStared:Bool = false
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
    var TeacherSelected:String = ""
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
        let moveUp: SKAction = SKAction.moveBy(x: 0, y: 5, duration: 0.1)
        MoveText()
        MoveBox()
        MoveStudent()
        setupPaperPlane()
        paperPlane.position = CGPoint(x: teacher.position.x, y: teacher.position.y + 80)
        if PaperPlaneM == 1 && paperPlane.position.y < 600{
            firePaperPlane()
            /*for BoxX in MyBox{
                var BoxXR = BoxX.position.x + 80
                var BoxXL = BoxX.position.x - 80
                if BoxX.position.y < self.paperPlane.position.y && BoxXR + 80 > self.paperPlane.position.x && BoxXL - 80 < self.paperPlane.position.x{
                    if BoxX.accessibilityLabel == self.paperPlane.name
                    {
                        print("i win")
                        PaperPlaneM == 0
                    }else{
                        print("student move")
                        PaperPlaneM == 0
                    }
                }else{
                    print("i loose ahah")
                    PaperPlaneM == 0
                }
            }*/
            

        }else{
            PaperPlaneM = 0
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
        //Move Student from left to right
        if(changeDirection == true){
            self.StudentSPeed *= -1
            self.enumerateChildNodes(withName: "Student") { node, stop in
                let student = node as! SKSpriteNode
                student.position.y -= CGFloat(46)
            }
            changeDirection = false
        }
        
    }
    func MoveText(){
        var changeDirection = false
        enumerateChildNodes(withName: "abc") { node, stop in
            let abc = node as! SKLabelNode
            abc.position.x -= CGFloat(self.abcSpeed)
            if(abc.position.x > self.rightBounds - 45.1 || abc.position.x < self.leftBounds + 45){
                changeDirection = true
            }
            
        }
        //Move Student from left to right
        if(changeDirection == true){
            self.abcSpeed *= -1
            self.enumerateChildNodes(withName: "abc") { node, stop in
                let abc = node as! SKLabelNode
                abc.position.y -= CGFloat(46)
            }
            changeDirection = false
        }
        
    }
    func MoveBox(){
        var changeDirection = false
        enumerateChildNodes(withName: "BoxX") { node, stop in
            let BoxX = node as! SKSpriteNode
            BoxX.position.x -= CGFloat(self.BoxSpeed)
            if(BoxX.position.x > self.rightBounds - 45.1 || BoxX.position.x < self.leftBounds + 45){
                changeDirection = true
            }
            
        }
        //Move Student from left to right
        if(changeDirection == true){
            self.BoxSpeed *= -1
            self.enumerateChildNodes(withName: "BoxX") { node, stop in
                let BoxX = node as! SKSpriteNode
                BoxX.position.y -= CGFloat(46)
            }
            changeDirection = false
        }
        
    }
    
    func firePaperPlane(){
        if canFire == false{
            return
        }else{
            canFire = false
            PaperPlaneM = 0
            let moveBulletAction = SKAction.move(to: CGPoint(x:paperPlane.position.x,y: paperPlane.position.y + 600), duration: 1.0)
            let removeBulletAction = SKAction.removeFromParent()
            paperPlane.run(SKAction.sequence([moveBulletAction,removeBulletAction]))
            Test.removeFromParent()
            OnOff = 0
        }
    }
    private func animate(){
        var TeacherTextures:[SKTexture] = []
        for i in 1...2 {
            TeacherTextures.append(SKTexture(imageNamed: "Teacher\(i)"))
        }
        let TeacherAnimation = SKAction.repeatForever( SKAction.animate(with: TeacherTextures, timePerFrame: 0.5))
    }
    override func didMove(to view: SKView) {
        self.physicsWorld.gravity = CGVector(dx: 0,dy: 0)
        self.physicsWorld.contactDelegate = self
        backgroundColor = SKColor.black
        rightBounds = self.size.width - 30
        setupStudent()
        setupTeacher()
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
         print("Collisiaaaaaon")
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        //To know wich one is the first and wich one the the second body
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            print("Collision")

        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
            print("Collisionnnnn")

        }
        
        if ((firstBody.categoryBitMask & CollisionCategories.Student != 0) &&
            (secondBody.categoryBitMask & CollisionCategories.TeacherBullet != 0)){
            print("Student et Teacher bullet contact")
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
                Boxe.name = line2
                VocWordTeacher.zPosition = 2
                VocWordTeacher.fontName = "Arial-Bold"
                VocWordTeacher.fontSize = 30
                VocWordTeacher.fontColor = SKColor.black
                VocWordTeacher.text = line
                VocWordTeacher.name = line2
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
                    
                case "MoveUp": PaperPlaneM = 1
                    
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
            var BoxPosXR = box.position.x + 100
            var BoxPosXL = box.position.x - 100
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
                        canFire = true
                        SetupPP = 1
                        Test.fontSize = 24
                        Test.fontColor = SKColor.black
                        Test.fontName = "Arial-Bold"
                        Test.text = box.name
                        Test.position = CGPoint(x: size.width / 2, y: size.height / 2)
                        Test.zPosition = 5
                        OnOff = 1
                        addChild(Test)
                    }
                }
                
            }
        }
    }
}
