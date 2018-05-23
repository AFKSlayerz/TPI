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
    var LanguagesTxT = SKLabelNode()
    let Back = SKLabelNode()
    let GO = SKLabelNode()
    let button = UIButton(type: UIButtonType.system) as UIButton
    var x:Int = 1
    var y:Int = 0
    var b:Int = 0
    var LanguagesX:Int = 200
    var LanguagesY:Int = 250
    var MyWords = [SKLabelNode]()
    var Word = SKLabelNode()
    var label = SKLabelNode()
    var LanguageProf:Int = 0
    var Id:Int = 0
    var buttons = [UIButton]()
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
        
        var buttonY: CGFloat = 200
        
        let button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 100, height: 100))
        button.position = CGPoint(x: size.width / 6.5, y: size.height / 1.2)
        button.isUserInteractionEnabled = true
        button.name = "BOUTTON1"
        LanguagesTxT = SKLabelNode(fontNamed: "Arial")
        LanguagesTxT.text = "button"
        LanguagesTxT.fontSize = 20
        LanguagesTxT.position = CGPoint(x: size.width / 6.5, y: size.height / 1.2)
        button.name = "LABEL1"
        let BOUTTON1 = self.childNode(withName, name: "//BOUTTON1")
        let LABEL1 = self.childNode(withName, name: "//LABEL1")
        
        self.addChild(LanguagesTxT)
        self.addChild(button)
        
        /*for word in VocProvider().Languages[1]{
            let button = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 100, height: 100))
            button.position = CGPoint(x: size.width / 6, y: size.height / 1.55)
            button.isUserInteractionEnabled = true
            button.value()
            self.addChild(button)
            let btn = UIButton(frame: CGRect(x: 200, y: buttonY, width: 450, height: 30))
            buttonY = buttonY + 50
            btn.backgroundColor = UIColor.darkGray
            btn.setTitle(word, for: UIControlState.normal)
            btn.addTarget(self, action: Selector(("btnPressed")), for: UIControlEvents.touchUpInside)
            btn.titleLabel?.text = word
            buttons.append(btn)
            self.view?.addSubview(btn)
            /*var line = ""
            label = LanguagesTxT.copy() as! SKLabelNode
            line += String(VocProvider().Languages[1][x])
            line += " "
            label.fontName = "Arial-Bold"
            label.fontSize = 28
            label.fontColor = SKColor.black
            label.text = line
            label.position = CGPoint(x: LanguagesX , y: LanguagesY)

            MyWords.append(label)
            addChild(label)
            LanguagesY = LanguagesY + 50*/
        }*/
        //Select language of the student
        SelectLanguageStudent.fontSize = 30
        SelectLanguageStudent.fontColor = SKColor.black
        SelectLanguageStudent.fontName = "Arial-Bold"
        SelectLanguageStudent.text = "Select the student language"
        SelectLanguageStudent.position = CGPoint(x: size.width / 4.5, y: size.height / 1.75)
        addChild(SelectLanguageStudent)
        SelectLanguageStudent.isHidden = true

        //GO
        GO.fontSize = 40
        GO.fontColor = SKColor.black
        GO.fontName = "Arial-Bold"
        GO.text = "GO !"
        GO.position = CGPoint(x: size.width / 2, y: size.height / 10)
        addChild(GO)
        GO.isHidden = true
        
        if Id == 0{
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
    /*[yourButton addTarget:self
    action:@selector(methodTouchDown:)
    forControlEvents:UIControlEventTouchDown];
    
    [yourButton addTarget:self
    action:@selector(methodTouchUpInside:)
    forControlEvents: UIControlEventTouchUpInside];
    
    -(void)methodTouchDown:(id)sender{
    
    NSLog(@"TouchDown");
    }
    -(void)methodTouchUpInside:(id)sender{
    
    NSLog(@"TouchUpInside");
    }*/
    func btnPressed(sender:UIButton!) {
        
        if sender.titleLabel?.text != nil {
            print("\(String(describing: sender.titleLabel?.text))")
        } else {
            
            print("error")
            
        }
        
    }
    /*override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        //Si FR(Flag 1) + ENG(Flag 2) -> Voc 1 et 2 ENG, Si ENG(Flag 11 + FR (Flag 12) -> Voc 3 et 4 FR
        //Si Voc 1 -> Flag 3, Voc 2 -> Flag 4, Voc 3 -> Flag 13, Voc 4 -> Flag 14
        if Id <= 1{
            for word in MyWords {
                if word.contains(touchLocation) && Id == 0{
                    SelectLanguageStudent.isHidden = false
                    SelectLanguageProf.isHidden = true
                    Back.isHidden = false
                    LanguageProf = Int(VocProvider().Languages[0][b])!
                    Id = Id + 1
                    b = 0
                }else if word.contains(touchLocation) && Id == 1{
                    LanguageEleve = Int(VocProvider().Languages[0][b])!
                    EnglishVoc.isHidden = false
                    b = 0
                    Id = Id + 1
                }
            }
        }*/
        
        /*if LanguageId == 1{
            SelectLanguageStudent.isHidden = false
            SelectLanguageProf.isHidden = true
        }
        if Back.contains(touchLocation) && Id >= 1{
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
        }
    }*/
}

