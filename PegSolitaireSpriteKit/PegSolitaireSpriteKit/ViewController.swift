//
//  ViewController.swift
//  PegSolitaireSpriteKit
//
//  Created by Jonathan Pappas on 12/17/21.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.skView {
            // Load the SKScene from 'GameScene.sks'
            let scene = PegScene(size: CGSize.init(width: 1000, height: 1000))
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
                
            // Present the scene
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}

