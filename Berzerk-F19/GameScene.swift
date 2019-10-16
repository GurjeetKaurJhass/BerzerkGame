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
    var player:SKSpriteNode!
    let PLAYER_SPEED:CGFloat = 20
    override func didMove(to view: SKView) {
        // SKPhysicsContactDelegate setup
        self.physicsWorld.contactDelegate = self
        // initialze the player
        self.player = self.childNode(withName: "player") as? SKSpriteNode
        
        
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
        
        // GAME LOGIC: Move player based on touch
                if (nodeTouched == "upButton") {
                    // move up
                    self.player.position.y = self.player.position.y + PLAYER_SPEED
                }
                else if (nodeTouched == "downButton") {
                    // move down
                    self.player.position.y = self.player.position.y - PLAYER_SPEED
                }
                else if (nodeTouched == "leftButton") {
                    // move left
                    self.player.position.x = self.player.position.x - PLAYER_SPEED
                }
                else if (nodeTouched == "rightButton") {
                   // move right
                    self.player.position.x = self.player.position.x + PLAYER_SPEED
               }
        
        
       }
    
    // detect when collision occurs
    func didBegin(_ contact: SKPhysicsContact) {
        
        
        
    }
}
