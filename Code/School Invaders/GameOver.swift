//
//  GameOver.swift
//  School Invaders
//
//  Created by Mikel Harnisch on 05.06.18.
//  Copyright © 2018 Mikel & Co. All rights reserved.
//

import Foundation
import SpriteKit    

class GameOver: SKScene {
    
    let Background = SKSpriteNode(imageNamed: "Background.jpg")
    let GameOverTxT = SKLabelNode()
    
    override init(size: CGSize) {
        super.init(size: size)
   
        
        
    Background.position = CGPoint(x: size.width / 2, y: size.height / 2)
    Background.size = CGSize(width: 1024, height: 900)
    Background.zPosition = 0
    self.addChild(Background)
    
        
    GameOverTxT.fontSize = 60
    GameOverTxT.fontColor = SKColor.black
    GameOverTxT.fontName = "Arial-Bold"
    GameOverTxT.text = "Game Over"
    GameOverTxT.position = CGPoint(x: size.width / 2, y: size.height / 2)
    GameOverTxT.zPosition = 1
    addChild(GameOverTxT)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
