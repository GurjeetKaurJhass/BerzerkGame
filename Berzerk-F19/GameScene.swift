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
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         // GET THE POSITION WHERE THE MOUSE WAS CLICKED
           // ---------------------------------------------
           let mouseTouch = touches.first
            if (mouseTouch == nil) {
                return
            }
            let location = mouseTouch!.location(in: self)
    
            // WHAT NODE DID THE PLAYER TOUCH
           // ----------------------------------------------
            let nodeTouched = atPoint(location).name
            print("Player touched: \(nodeTouched)")
       }
    
    // detect when collision occurs
    func didBegin(_ contact: SKPhysicsContact) {
        
        
        
    }
}
