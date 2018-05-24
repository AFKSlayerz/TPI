//
//  MenuScene.swift
//  School Invaders
//
//  Created by Mikel Harnisch on 15.05.18.
//  Copyright © 2018 Mikel & Co. All rights reserved.
//

import UIKit
import SpriteKit

public var flag: Int = 0
public var ChosenVoc:Int = 0

class MenuScene: SKScene {
    let SelectLanguageStudent = SKLabelNode()
    let SelectLanguageProf = SKLabelNode()
    let Test1 = SKLabelNode()
    let Test2 = SKLabelNode()
    var Voc = SKLabelNode()
    var LanguagesTxT = SKLabelNode()
    var VocTxT = SKLabelNode()
    let ChooseVoc = SKLabelNode()
    let Back = SKLabelNode()
    let GO = SKLabelNode()
    let button = UIButton(type: UIButtonType.system) as UIButton
    var x:Int = 0
    var Id:Int = 0
    var i:Int = 0
    var flag:Int = 0
    var LanguagesX:Int = 0
    var LanguagesY:Int = 0
    var VocX:Double = 0
    var VocY:Int = 0
    var MyWords = [SKLabelNode]()
    var MyVocs = [SKLabelNode]()
    var label = SKLabelNode()
    var LanguageProf:Int = 0
    var LanguageEleve:Int = 0
    var LabelId:String = "-1"
    var VocId:String = "0"
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    override init(size: CGSize) {
        super.init(size: size)
        LanguagesX = Int(screenWidth) / 5
        LanguagesY = Int(screenHeight) / 2
        VocX = Double(screenWidth) / 1.4
        VocY = Int(screenHeight) / 2
        backgroundColor = SKColor.white
        
        
        
        //Select language of the professor
        SelectLanguageProf.fontSize = 48
        SelectLanguageProf.fontColor = SKColor.black
        SelectLanguageProf.fontName = "Arial-Bold"
        SelectLanguageProf.text = "Teacher language"
        SelectLanguageProf.position = CGPoint(x: size.width / 4.5, y: size.height / 1.75)
        addChild(SelectLanguageProf)
        
        
        for _ in VocProvider().Languages[1]{
            var line = ""
            label = LanguagesTxT.copy() as! SKLabelNode
            line += String(VocProvider().Languages[1][x])
            line += " "
            label.fontName = "Arial-Bold"
            label.fontSize = 40
            label.text = line
            label.fontColor = SKColor.black
            label.position = CGPoint(x: LanguagesX , y: LanguagesY)
            var z = Int(LabelId)!
            z+=1
            LabelId = String(z)
            label.name = LabelId
            MyWords.append(label)
            addChild(label)
            LanguagesY = LanguagesY - 80
            x+=1
        }
        //Select language of the student
        SelectLanguageStudent.fontSize = 48
        SelectLanguageStudent.fontColor = SKColor.black
        SelectLanguageStudent.fontName = "Arial-Bold"
        SelectLanguageStudent.text = "Student language"
        SelectLanguageStudent.position = CGPoint(x: size.width / 4.5, y: size.height / 1.75)
        addChild(SelectLanguageStudent)
        SelectLanguageStudent.isHidden = true
        /*
        Test1.fontSize = 40
        Test1.fontColor = SKColor.black
        Test1.fontName = "Arial-Bold"
        Test1.text = "English Voc"
        Test1.position = CGPoint(x: size.width / 1.05, y: size.height / 1.75)
        addChild(Test1)
        Test1.isHidden = true*/
        
        /*
        Test2.fontSize = 40
        Test2.fontColor = SKColor.black
        Test2.fontName = "Arial-Bold"
        Test2.text = "Francais Voc"
        Test2.position = CGPoint(x: size.width / 1.05, y: size.height / 2.1)
        addChild(Test2)
        Test2.isHidden = true
        */
        
        
         Test2.fontSize = 40
         Test2.fontColor = SKColor.black
         Test2.fontName = "Arial-Bold"
         Test2.text = "Francais Voc"
         Test2.position = CGPoint(x: size.width / 1.05, y: size.height / 2.1)
         addChild(Test2)
         Test2.isHidden = true
        
        
        ChooseVoc.fontSize = 45
        ChooseVoc.fontColor = SKColor.black
        ChooseVoc.fontName = "Arial-Bold"
        ChooseVoc.text = "Choose a vocabulary"
        ChooseVoc.position = CGPoint(x: size.width / 1.35, y: size.height / 1.75)
        addChild(ChooseVoc)
        ChooseVoc.isHidden = true
        
        //GO
        GO.fontSize = 50
        GO.fontColor = SKColor.black
        GO.fontName = "Arial-Bold"
        GO.text = "GO !"
        GO.position = CGPoint(x: size.width / 2, y: size.height / 10)
        addChild(GO)
        GO.isHidden = true
        
        if flag == 0{
            Back.isHidden = true
        }
        
        Back.fontSize = 34
        Back.fontColor = SKColor.black
        Back.fontName = "Arial-Bold"
        Back.text = "Retour"
        Back.position = CGPoint(x: size.width / 12, y: size.height / 1.1)
        addChild(Back)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        //If the student language is chosen
        if flag == 1{
            flag = 2
            for word in MyWords {
                if word.contains(touchLocation){
                    SelectLanguageStudent.isHidden = false
                    SelectLanguageProf.isHidden = true
                    Back.isHidden = false
                    let z = Int(word.name!)!
                    LanguageEleve = Int(VocProvider().Languages[0][z])!
                    //Test2.isHidden = false
                    //Test2.text = String(LanguageEleve)
                    ChooseVoc.isHidden = false
                }
            }
        }
        
        //If the professor language is chosen
        if flag == 0{
            flag = 1
            for word in MyWords {
                if word.contains(touchLocation){
                    SelectLanguageStudent.isHidden = false
                    SelectLanguageProf.isHidden = true
                    Back.isHidden = false
                    let z = Int(word.name!)!
                    LanguageProf = Int(VocProvider().Languages[0][z])!
                    //Test1.isHidden = false
                    //Test1.text = String(LanguageProf)
                }
            }
        }
        
        //if the professor and student language are chosen
        if flag == 2{
            for _ in VocProvider().Vocabulary[0]
            {
                let lngprof = VocProvider().Vocabulary[2][i]
                let lngeleve = VocProvider().Vocabulary[3][i]
                if lngprof == String(LanguageProf) && lngeleve == String(LanguageEleve)
                {
                    var line = ""
                    Voc = VocTxT.copy() as! SKLabelNode
                    line += String(VocProvider().Vocabulary[1][i])
                    line += " "
                    Voc.fontName = "Arial-Bold"
                    Voc.fontSize = 40
                    Voc.fontColor = SKColor.black
                    Voc.text = line
                    Voc.position = CGPoint(x: Int(VocX) , y: VocY)
                    VocId = String(i)
                    Voc.name = VocId
                    MyVocs.append(Voc)
                    addChild(Voc)
                    VocY = VocY - 80
                }
                i+=1
            }
            flag = 3
        }
        
        if flag == 1{
            SelectLanguageStudent.isHidden = false
            SelectLanguageProf.isHidden = true
        }
        
        //If a vocabulary is chosen
        if flag == 3{
            for Vocs in MyVocs {
                if Vocs.contains(touchLocation){
                    GO.isHidden = false
                    let z = Int(Vocs.name!)!
                    ChosenVoc = Int(VocProvider().Vocabulary[0][z])!
                    flag = 4
                }
            }
        }
        
        if GO.contains(touchLocation)
        {
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let gameScene = GameScene(size: self.size)
            self.view?.presentScene(gameScene, transition: reveal)
        }
        
        /*if Back.contains(touchLocation) && flag >= 1{
            flag-=1
                switch flag{
            
                case 2: GO.isHidden = true
                
                default:
                    flag = flag + 0
                }
        }*/
    }
}
