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
    
    //Initilize the static text
    let Background = SKSpriteNode(imageNamed: "Background.jpg")
    let SelectLanguageStudent = SKLabelNode()
    let SelectLanguageProf = SKLabelNode()
    let ChooseVoc = SKLabelNode()
    let Back = SKLabelNode()
    let GO = SKLabelNode()

    //Initialize dynamic text
    var Voc = SKLabelNode()
    var VocTxT = SKLabelNode()
    var LanguagesTxT = SKLabelNode()
    var Languages = SKLabelNode()

    //Voc and Language array
    var MyWords = [SKLabelNode]()
    var MyVocs = [SKLabelNode]()
    
    //Incremental and position variable
    var LanguagesX:Int = 0
    var LanguagesY:Int = 0
    var VocX:Double = 0
    var VocY:Int = 0
    var x:Int = 0
    var i:Int = 0
    var flag:Int = 0
    var LanguageProf:Int = 0
    var LanguageEleve:Int = 0
    var LabelId:String = "-1"
    var VocId:String = "0"
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
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
        
        //Set the Text and languages on the field
        SelectLanguageProf.fontSize = 48
        SelectLanguageProf.fontColor = SKColor.black
        SelectLanguageProf.fontName = "Arial-Bold"
        SelectLanguageProf.text = "Teacher language"
        SelectLanguageProf.position = CGPoint(x: size.width / 4.5, y: size.height / 1.75)
        SelectLanguageProf.zPosition = 1
        addChild(SelectLanguageProf)
        
        Background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        Background.size = CGSize(width: 1024, height: 900)
        Background.zPosition = 0
        self.addChild(Background)
        
        for _ in VocProvider().Languages[1]{
            var line = ""
            Languages = LanguagesTxT.copy() as! SKLabelNode
            line += String(VocProvider().Languages[1][x])
            line += " "
            Languages.fontName = "Arial-Bold"
            Languages.fontSize = 40
            Languages.text = line
            Languages.fontColor = SKColor.black
            Languages.position = CGPoint(x: LanguagesX , y: LanguagesY)
            Languages.zPosition = 1
            var z = Int(LabelId)!
            z+=1
            LabelId = String(z)
            Languages.name = LabelId
            MyWords.append(Languages)
            addChild(Languages)
            LanguagesY = LanguagesY - 80
            x+=1
        }
        
        SelectLanguageStudent.fontSize = 48
        SelectLanguageStudent.fontColor = SKColor.black
        SelectLanguageStudent.fontName = "Arial-Bold"
        SelectLanguageStudent.text = "Student language"
        SelectLanguageStudent.position = CGPoint(x: size.width / 4.5, y: size.height / 1.75)
        SelectLanguageStudent.zPosition = 2
        addChild(SelectLanguageStudent)
        SelectLanguageStudent.isHidden = true
    
        ChooseVoc.fontSize = 45
        ChooseVoc.fontColor = SKColor.black
        ChooseVoc.fontName = "Arial-Bold"
        ChooseVoc.text = "Choose a vocabulary"
        ChooseVoc.position = CGPoint(x: size.width / 1.35, y: size.height / 1.75)
        ChooseVoc.zPosition = 1
        addChild(ChooseVoc)
        ChooseVoc.isHidden = true
        
        //GO
        GO.fontSize = 50
        GO.fontColor = SKColor.black
        GO.fontName = "Arial-Bold"
        GO.text = "GO !"
        GO.position = CGPoint(x: size.width / 2, y: size.height / 10)
        GO.zPosition = 1
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
        Back.zPosition = 1
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
            for word in MyWords {
                if word.contains(touchLocation){
                    SelectLanguageStudent.isHidden = false
                    SelectLanguageProf.isHidden = true
                    Back.isHidden = false
                    let z = Int(word.name!)!
                    LanguageEleve = Int(VocProvider().Languages[0][z])!
                    ChooseVoc.isHidden = false
                    print(flag)
                    flag = 2
                }
            }
        }
        
        //If the professor language is chosen
        if flag == 0{
            for word in MyWords {
                if word.contains(touchLocation){
                    SelectLanguageStudent.isHidden = false
                    SelectLanguageProf.isHidden = true
                    Back.isHidden = false
                    let z = Int(word.name!)!
                    LanguageProf = Int(VocProvider().Languages[0][z])!
                    flag = 1
                    print(flag)

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
                    Voc.zPosition = 1
                    VocId = String(i)
                    Voc.name = VocId
                    MyVocs.append(Voc)
                    addChild(Voc)
                    VocY = VocY - 80
                    flag = 3
                }
                i+=1
            }
            
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
        
        if Back.contains(touchLocation) && flag >= 1{
            flag-=1
                switch flag{
            
                case 2: MyVocs = []
                        MyWords = []
                        i = 0
                    
                    
                case 3: GO.isHidden = true
                        
                
                default:
                    flag = flag + 0
                }
        }
    }
}
