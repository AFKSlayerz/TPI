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
    let Voc1 = SKLabelNode()
    let Voc2 = SKLabelNode()
    let Voc3 = SKLabelNode()
    let Voc4 = SKLabelNode()
    let FrancaisTxT = SKLabelNode()
    let EnglishTxT = SKLabelNode()
    let DeutschTxT = SKLabelNode()
    let ItalianoTxT = SKLabelNode()
    let Back = SKLabelNode()
    let GO = SKLabelNode()

    
    
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
        
        //Francais
        FrancaisTxT.fontSize = 28
        FrancaisTxT.fontColor = SKColor.black
        FrancaisTxT.fontName = "Arial-Bold"
        FrancaisTxT.text = "Français"
        FrancaisTxT.position = CGPoint(x: size.width / 4.5, y: size.height / 2.1)
        addChild(FrancaisTxT)
        
        //English
        EnglishTxT.fontSize = 28
        EnglishTxT.fontColor = SKColor.black
        EnglishTxT.fontName = "Arial-Bold"
        EnglishTxT.text = "English"
        EnglishTxT.position = CGPoint(x: size.width / 4.5, y: size.height / 2.6)
        addChild(EnglishTxT)
        
        //Select language of the student
        SelectLanguageStudent.fontSize = 30
        SelectLanguageStudent.fontColor = SKColor.black
        SelectLanguageStudent.fontName = "Arial-Bold"
        SelectLanguageStudent.text = "Select the student language"
        SelectLanguageStudent.position = CGPoint(x: size.width / 4.5, y: size.height / 1.75)
        addChild(SelectLanguageStudent)
        SelectLanguageStudent.isHidden = true
        
        //English Vocabulary
        EnglishVoc.fontSize = 30
        EnglishVoc.fontColor = SKColor.black
        EnglishVoc.fontName = "Arial-Bold"
        EnglishVoc.text = "Vocabulaire Français"
        EnglishVoc.position = CGPoint(x: size.width / 1.35, y: size.height / 1.75)
        addChild(EnglishVoc)
        EnglishVoc.isHidden = true
        
        //French Vocabulary
        FrancaisVoc.fontSize = 30
        FrancaisVoc.fontColor = SKColor.black
        FrancaisVoc.fontName = "Arial-Bold"
        FrancaisVoc.text = "English Vocabulary"
        FrancaisVoc.position = CGPoint(x: size.width / 1.35, y: size.height / 1.75)
        addChild(FrancaisVoc)
        FrancaisVoc.isHidden = true
        
        //Voc 1 (English)
        Voc1.fontSize = 28
        Voc1.fontColor = SKColor.black
        Voc1.fontName = "Arial-Bold"
        Voc1.text = "Voc.1"
        Voc1.position = CGPoint(x: size.width / 1.35, y: size.height / 2.1)
        addChild(Voc1)
        Voc1.isHidden = true
        
        //Voc 2 (English)
        Voc2.fontSize = 28
        Voc2.fontColor = SKColor.black
        Voc2.fontName = "Arial-Bold"
        Voc2.text = "Voc.2"
        Voc2.position = CGPoint(x: size.width / 1.35, y: size.height / 2.6)
        addChild(Voc2)
        Voc2.isHidden = true
        
        //Voc 3 (French)
        Voc3.fontSize = 28
        Voc3.fontColor = SKColor.black
        Voc3.fontName = "Arial-Bold"
        Voc3.text = "Voc.3"
        Voc3.position = CGPoint(x: size.width / 1.35, y: size.height / 2.1)
        addChild(Voc3)
        Voc3.isHidden = true

        //Voc 4 (French)
        Voc4.fontSize = 28
        Voc4.fontColor = SKColor.black
        Voc4.fontName = "Arial-Bold"
        Voc4.text = "Voc.4"
        Voc4.position = CGPoint(x: size.width / 1.35, y: size.height / 2.6)
        addChild(Voc4)
        Voc4.isHidden = true

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
        //Si FR(Flag 1) + ENG(Flag 2) -> Voc 1 et 2 ENG, Si ENG(Flag 11 + FR (Flag 12) -> Voc 3 et 4 FR
        //Si Voc 1 -> Flag 3, Voc 2 -> Flag 4, Voc 3 -> Flag 13, Voc 4 -> Flag 14
        if FrancaisTxT.contains(touchLocation)  && flag == 0 {
            SelectLanguageStudent.isHidden = false
            SelectLanguageProf.isHidden = true
            Back.isHidden = false
            flag = 1
            FrancaisTxT.fontColor = SKColor.gray
            
        }else if EnglishTxT.contains(touchLocation) && flag == 1{
            EnglishVoc.isHidden = false
            Voc1.isHidden = false
            Voc2.isHidden = false
            flag = 2
            EnglishTxT.fontColor = SKColor.gray
        }else if Back.contains(touchLocation) && flag >= 1{
                flag = flag - 1

                switch flag{
                    
                case 0: FrancaisTxT.fontColor = SKColor.black
                        SelectLanguageProf.isHidden = false
                        SelectLanguageStudent.isHidden = true
                        Back.isHidden = true
                    
                case 1: EnglishTxT.fontColor = SKColor.black
                        EnglishVoc.isHidden = true
                        Voc1.isHidden = true
                        Voc2.isHidden = true

                    
                case 2: Voc1.fontColor = SKColor.black
                        GO.isHidden = true
                    
                case 3: Voc2.fontColor = SKColor.black
                        GO.isHidden = true
                        flag = flag - 1
                    
                case 10:EnglishTxT.fontColor = SKColor.black
                        SelectLanguageProf.isHidden = false
                        SelectLanguageStudent.isHidden = true
                        Back.isHidden = true
                        flag = flag - 10
                    
                case 11:FrancaisTxT.fontColor = SKColor.black
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
        if EnglishTxT.contains(touchLocation)  && flag == 0 {
            SelectLanguageStudent.isHidden = false
            SelectLanguageProf.isHidden = true
            flag = 11
            Back.isHidden = false
            EnglishTxT.fontColor = SKColor.gray

        }else if FrancaisTxT.contains(touchLocation)  && flag == 11 {
            FrancaisVoc.isHidden = false
            Voc3.isHidden = false
            Voc4.isHidden = false
            flag = 12
            FrancaisTxT.fontColor = SKColor.gray

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
        }
    }
}

//}

