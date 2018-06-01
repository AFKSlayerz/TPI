//
//  PaperPlane.swift
//  School Invaders
//
//  Created by Mikel Harnisch on 29.05.18.
//  Copyright © 2018 Mikel & Co. All rights reserved.
//
import UIKit
import SpriteKit

class PaperPlane: SKSpriteNode {
    
    
    init() {
        let texture = SKTexture(imageNamed: "PaperPlane.png")
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        self.name = "PaperPlane"
        self.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        self.physicsBody!.isDynamic = true
        self.physicsBody!.categoryBitMask = CollisionCategories.TeacherBullet
        self.physicsBody!.contactTestBitMask = CollisionCategories.Student
        self.physicsBody!.collisionBitMask = 0x0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
