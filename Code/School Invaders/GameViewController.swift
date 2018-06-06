//
//  GameViewController.swift
//  School Invaders
//
//  Created by Mikel Harnisch on 09.05.18.
//  Copyright © 2018 Mikel & Co. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var scene: GameScene!                       //Type : GameScene, Name : scene
    var GameInt = 0

    //Launch screen goes on the MenuScene
    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = view as? SKView {
            // Create the scene programmatically
            let menuScene = MenuScene(size: view.bounds.size)
            let value = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            menuScene.scaleMode = .resizeFill
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            view.presentScene(menuScene)
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscapeLeft
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
}
