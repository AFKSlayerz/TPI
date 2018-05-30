//
//  Teacher.swift
//  School Invaders
//
//  Created by Mikel Harnisch on 30.05.18.
//  Copyright © 2018 Mikel & Co. All rights reserved.
//

import UIKit
import SpriteKit


class Teacher: SKSpriteNode {
     private var canFire = true
    
    init() {
        let texture = SKTexture(imageNamed: "Teacher1.png")
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        animate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func animate(){
        var TeacherTextures:[SKTexture] = []
        for i in 1...2 {
            TeacherTextures.append(SKTexture(imageNamed: "Teacher\(i)"))
        }
        let TeacherAnimation = SKAction.repeatForever( SKAction.animate(with: TeacherTextures, timePerFrame: 0.5))
        self.run(TeacherAnimation)
    }
    
    
    func die (){
        
    }
    
    func kill(){
        
    }
    
    func respawn(){
        
    }
    
    /*func fireBullet(scene: SKScene){
        if(!canFire){
            return
        }else{
            canFire = false
            let bullet = PlayerBullet(imageName: "PaperPlane.png",bulletSound: "Plane.mp3")
            bullet.position.x = self.position.x
            bullet.position.y = self.position.y + self.size.height/2
            scene.addChild(bullet)
            let moveBulletAction = SKAction.moveTo(CGPoint(x:self.position.x,y:scene.size.height + bullet.size.height), duration: 1.0)
            let removeBulletAction = SKAction.removeFromParent()
            bullet.runAction(SKAction.sequence([moveBulletAction,removeBulletAction]))
            let waitToEnableFire = SKAction.waitForDuration(0.5)
            runAction(waitToEnableFire,completion:{
                self.canFire = true
            })
        }
    }*/
}
