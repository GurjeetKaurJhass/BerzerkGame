//
//  GameScene.swift
//  Berzerk-F19
//
//  Created by MacStudent on 2019-10-10.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    override func didMove(to view: SKView) {
        // SKPhysicsContactDelegate setup
        self.physicsWorld.contactDelegate = self
    }
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    // detect when collision occurs
    func didBegin(_ contact: SKPhysicsContact) {
        
    }
}
