//
//  PaperPlane.swift
//  School Invaders
//
//  Created by Mikel Harnisch on 29.05.18.
//  Copyright © 2018 Mikel & Co. All rights reserved.
//
import SpriteKit
import UIKit
class PaperPlane:GameScene {
    
    func CreatePP() {
        
        let newPlane = SKSpriteNode(imageNamed: "PaperPlane.png")
        newPlane.position = CGPoint(x: PaperPlaneX, y: PaperPlaneY)
        newPlane.size = CGSize(width: 50, height: 80)
        self.addChild(newPlane)

    }
    
}
