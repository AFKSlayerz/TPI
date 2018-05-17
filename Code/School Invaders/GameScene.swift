//
//  GameScene.swift
//  School Invaders
//
//  Created by Mikel Harnisch on 09.05.18.
//  Copyright © 2018 Mikel & Co. All rights reserved.
//

import UIKit
import SpriteKit

class StudentWalk: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "static")
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    
    
    func beginAnimation() {
        let textureAtlas = SKTextureAtlas(named: "Student")
        let frames = ["static", "leftwalk", "rightwalk"].map { textureAtlas.textureNamed($0) }
        let animate = SKAction.animate(with: frames, timePerFrame: 0.1)
        let forever = SKAction.repeatForever(animate)
        self.run(forever)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let studentWalk = StudentWalk()
        studentWalk.position = CGPoint(x: size.width / 2, y: size.height / 1.5)
        addChild(studentWalk)
        
        studentWalk.beginAnimation()
    }
    let Voc1Eng = SKLabelNode()
    let Voc2Eng = SKLabelNode()
    let Voc3Eng = SKLabelNode()
    let Voc4Eng = SKLabelNode()
    let Error = SKLabelNode()
    let Back = SKLabelNode()
    let Student = SKSpriteNode(imageNamed: "Student.png")
    let Teacher = SKSpriteNode(imageNamed: "Teacher.png")
    let PaperPlane = SKSpriteNode(imageNamed: "PaperPlane.png")


    override init(size: CGSize) {
        super.init(size: size)
        
        backgroundColor = SKColor.white
        
        Student.position = CGPoint(x: size.width / 2, y: size.height / 1.1)  //The game will be built from the top-left
        Student.size = CGSize(width: 80, height: 90)  //The anchor point (top left)
        addChild(Student)
        
        Teacher.position = CGPoint(x: size.width / 2, y: size.height / 7)  //The game will be built from the top-left
        Teacher.size = CGSize(width: 80, height: 90)  //The anchor point (top left)
        addChild(Teacher)
        
        PaperPlane.position = CGPoint(x: size.width / 2, y: size.height / 4)  //The game will be built from the top-left
        PaperPlane.size = CGSize(width: 50, height: 80)  //The anchor point (top left)
        addChild(PaperPlane)
        
        Back.fontSize = 24
        Back.fontColor = SKColor.black
        Back.fontName = "Arial-Bold"
        Back.text = "Retour"
        Back.position = CGPoint(x: size.width / 1.05, y: size.height / 1)
        addChild(Back)
        
        switch flag{
        case 3: Voc1Eng.fontSize = 30
        Voc1Eng.fontColor = SKColor.black
        Voc1Eng.text = "Voc1 anglais"
        Voc1Eng.position = CGPoint(x: size.width / 7, y: size.height / 1.75)
        addChild(Voc1Eng)
            
        case 4: Voc2Eng.fontSize = 30
        Voc2Eng.fontColor = SKColor.black
        Voc2Eng.text = "Voc2 anglais"
        Voc2Eng.position = CGPoint(x: size.width / 7, y: size.height / 1.75)
        addChild(Voc2Eng)
            
        case 13:Voc3Eng.fontSize = 30
        Voc3Eng.fontColor = SKColor.black
        Voc3Eng.text = "Voc3 français"
        Voc3Eng.position = CGPoint(x: size.width / 7, y: size.height / 1.75)
        addChild(Voc3Eng)
            
        case 14:Voc4Eng.fontSize = 30
        Voc4Eng.fontColor = SKColor.black
        Voc4Eng.text = "Voc4 français"
        Voc4Eng.position = CGPoint(x: size.width / 7, y: size.height / 1.75)
        addChild(Voc4Eng)
            
        default:Error.fontSize = 30
        Error.fontColor = SKColor.black
        Error.text = "Error"
        Error.position = CGPoint(x: size.width / 7, y: size.height / 1.75)
        addChild(Error)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        if Back.contains(touchLocation) {
            flag = 0
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let menuScene = MenuScene(size: self.size)
            self.view?.presentScene(menuScene, transition: reveal)
        }
    }
}
