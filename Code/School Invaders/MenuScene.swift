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

class MenuScene: SKScene {
    let SelectLanguageStudent = SKLabelNode()
    let SelectLanguageProf = SKLabelNode()
    let EnglishVoc = SKLabelNode()
    let FrancaisVoc = SKLabelNode()
    var Voc = SKLabelNode()
    var LanguagesTxT = SKLabelNode()
    var VocTxT = SKLabelNode()
    let Back = SKLabelNode()
    let GO = SKLabelNode()
    let button = UIButton(type: UIButtonType.system) as UIButton
    var x:Int = 0
    var y:Int = 0
    var yId:Int = 0
    var b:Int = 0
    var z:Int = 0
    var Id:Int = 0
    var w:Int = 0
    var i:Int = 0
    var flag:Int = 0
    var LanguagesX:Int = 200
    var LanguagesY:Int = 400
    var VocX:Int = 500
    var VocY:Int = 400
    var MyWords = [SKLabelNode]()
    var MyVocs = [SKLabelNode]()
    var Word = SKLabelNode()
    var label = SKLabelNode()
    var LanguageProf:Int = 0
    var LanguageEleve:Int = 0
    var LabelId:String = "-1"
    var VocId:String = "1"
    override init(size: CGSize) {
        super.init(size: size)
        
        backgroundColor = SKColor.white
        
        
        
        //Select language of the professor
        SelectLanguageProf.fontSize = 30
        SelectLanguageProf.fontColor = SKColor.black
        SelectLanguageProf.fontName = "Arial-Bold"
        SelectLanguageProf.text = "Select the professor language"
        SelectLanguageProf.position = CGPoint(x: size.width / 4.5, y: size.height / 1.75)
        addChild(SelectLanguageProf)
        
        
        for word in VocProvider().Languages[1]{
            var line = ""
            label = LanguagesTxT.copy() as! SKLabelNode
            line += String(VocProvider().Languages[1][x])
            line += " "
            label.fontName = "Arial-Bold"
            label.fontSize = 28
            label.text = line
            label.fontColor = SKColor.black
            label.position = CGPoint(x: LanguagesX , y: LanguagesY)
            y = Int(LabelId)!
            self.y+=1
            LabelId = String(y)
            label.name = LabelId
            MyWords.append(label)
            addChild(label)
            LanguagesY = LanguagesY - 50
            x+=1
        }
        //Select language of the student
        SelectLanguageStudent.fontSize = 30
        SelectLanguageStudent.fontColor = SKColor.black
        SelectLanguageStudent.fontName = "Arial-Bold"
        SelectLanguageStudent.text = "Select the student language"
        SelectLanguageStudent.position = CGPoint(x: size.width / 4.5, y: size.height / 1.75)
        addChild(SelectLanguageStudent)
        SelectLanguageStudent.isHidden = true

        EnglishVoc.fontSize = 40
        EnglishVoc.fontColor = SKColor.black
        EnglishVoc.fontName = "Arial-Bold"
        EnglishVoc.text = "English Voc"
        EnglishVoc.position = CGPoint(x: size.width / 1.05, y: size.height / 1.75)
        addChild(EnglishVoc)
        EnglishVoc.isHidden = true
        
        
        FrancaisVoc.fontSize = 40
        FrancaisVoc.fontColor = SKColor.black
        FrancaisVoc.fontName = "Arial-Bold"
        FrancaisVoc.text = "Francais Voc"
        FrancaisVoc.position = CGPoint(x: size.width / 1.05, y: size.height / 2.1)
        addChild(FrancaisVoc)
        FrancaisVoc.isHidden = true
        
        //GO
        GO.fontSize = 40
        GO.fontColor = SKColor.black
        GO.fontName = "Arial-Bold"
        GO.text = "GO !"
        GO.position = CGPoint(x: size.width / 2, y: size.height / 10)
        addChild(GO)
        GO.isHidden = true
        
        if flag == 0{
            Back.isHidden = true
        }
        Back.fontSize = 28
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
        
        if flag == 1{
            flag += 1
            for word in MyWords {
                if word.contains(touchLocation){
                    SelectLanguageStudent.isHidden = false
                    SelectLanguageProf.isHidden = true
                    Back.isHidden = false
                    z = Int(word.name!)!
                    LanguageEleve = Int(VocProvider().Languages[0][z])!
                    FrancaisVoc.isHidden = false
                    FrancaisVoc.text = String(LanguageEleve)
                }
            }
        }
        
        if flag == 0{
            flag += 1
            for word in MyWords {
                if word.contains(touchLocation){
                    SelectLanguageStudent.isHidden = false
                    SelectLanguageProf.isHidden = true
                    Back.isHidden = false
                    z = Int(word.name!)!
                    LanguageProf = Int(VocProvider().Languages[0][z])!
                    EnglishVoc.isHidden = false
                    EnglishVoc.text = String(LanguageProf)
                }
            }
        }
        while flag == 2{
            for ID in VocProvider().Vocabulary[0]
            {
                var lngprof = VocProvider().Vocabulary[2][i]
                var lngeleve = VocProvider().Vocabulary[3][i]
                if lngprof == String(LanguageProf) && lngeleve == String(LanguageEleve)
                {
                    var line = ""
                    Voc = VocTxT.copy() as! SKLabelNode
                    line += String(VocProvider().Vocabulary[1][i])
                    line += " "
                    Voc.fontName = "Arial-Bold"
                    Voc.fontSize = 28
                    Voc.fontColor = SKColor.black
                    Voc.text = line
                    Voc.position = CGPoint(x: VocX , y: VocY)
                    yId = Int(LabelId)!
                    self.yId+=1
                    LabelId = String(yId)
                    Voc.name = LabelId
                    MyVocs.append(Voc)
                    addChild(Voc)
                    VocY = VocY - 50
                }
                i+=1
            }
            flag += 1
        }
        if flag == 1{
            SelectLanguageStudent.isHidden = false
            SelectLanguageProf.isHidden = true
        }
        /*if Back.contains(touchLocation) && flag >= 1{
                Id = Id - 1

                switch flag{
                    
                case 0: LanguagesTxT.fontColor = SKColor.black
                        SelectLanguageProf.isHidden = false
                        SelectLanguageStudent.isHidden = true
                        Back.isHidden = true
                    
                case 1: LanguagesTxT.fontColor = SKColor.black
                        EnglishVoc.isHidden = true
                        Voc1.isHidden = true
                        Voc2.isHidden = true

                    
                case 2: Voc1.fontColor = SKColor.black
                        GO.isHidden = true
                    
                case 3: Voc2.fontColor = SKColor.black
                        GO.isHidden = true
                        flag = flag - 1
                    
                case 10:LanguagesTxT.fontColor = SKColor.black
                        SelectLanguageProf.isHidden = false
                        SelectLanguageStudent.isHidden = true
                        Back.isHidden = true
                        flag = flag - 10
                    
                case 11:LanguagesTxT.fontColor = SKColor.black
                        FrancaisVoc.isHidden = true
                        Voc3.isHidden = true
                        Voc4.isHidden = true
                    
                case 12:Voc3.fontColor = SKColor.black
                        GO.isHidden = true
                    
                case 13:Voc4.fontColor = SKColor.black
                        GO.isHidden = true
                        flag = flag - 1
                    
                
                default:
                    flag = flag + 0
                }
        }
        if LanguagesTxT.contains(touchLocation)  && flag == 0 {
            SelectLanguageStudent.isHidden = false
            SelectLanguageProf.isHidden = true
            flag = 11
            Back.isHidden = false
            LanguagesTxT.fontColor = SKColor.gray

        }else if LanguagesTxT.contains(touchLocation)  && flag == 11 {
            FrancaisVoc.isHidden = false
            Voc3.isHidden = false
            Voc4.isHidden = false
            flag = 12
            LanguagesTxT.fontColor = SKColor.gray

        }else if Voc1.contains(touchLocation) && flag == 2{
            flag = 3
            GO.isHidden = false
            Voc1.fontColor = SKColor.gray

        }else if Voc2.contains(touchLocation) && flag == 2{
            flag = 4
            GO.isHidden = false
            Voc2.fontColor = SKColor.gray

        }else if Voc3.contains(touchLocation) && flag == 12{
            flag = 13
            GO.isHidden = false
            Voc3.fontColor = SKColor.gray

        }else if Voc4.contains(touchLocation) && flag == 12{
            flag = 14
            GO.isHidden = false
            Voc4.fontColor = SKColor.gray

        }else if GO.contains(touchLocation){
            let reveal = SKTransition.doorsOpenVertical(withDuration: 0.5)
            let gameScene = GameScene(size: self.size)
            self.view?.presentScene(gameScene, transition: reveal)
        }*/
    }
}
