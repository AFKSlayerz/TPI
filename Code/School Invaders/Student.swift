//
//  Student.swift
//  School Invaders
//
//  Created by Mikel Harnisch on 30.05.18.
//  Copyright © 2018 Mikel & Co. All rights reserved.
//

import UIKit
import SpriteKit

class Student: SKSpriteNode {
    
    var StudentRow = 0
    var StudentColumn = 0
    
    //Set the hit box and the touchable sprite
    init() {
        let texture = SKTexture(imageNamed: "Student1.png")
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        self.name = "Student"
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 50))
        self.physicsBody?.categoryBitMask = CollisionCategories.Student
        self.physicsBody?.contactTestBitMask = CollisionCategories.PaperPlane | CollisionCategories.Teacher
        self.physicsBody?.collisionBitMask = 0x0

        animate()

    }
    private func animate(){
        var StudentTextures:[SKTexture] = []
        for i in 1...2 {
            StudentTextures.append(SKTexture(imageNamed: "Student\(i)"))
        }
        let StudentAnimation = SKAction.repeatForever( SKAction.animate(with: StudentTextures, timePerFrame: 0.4))
        self.run(StudentAnimation)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
