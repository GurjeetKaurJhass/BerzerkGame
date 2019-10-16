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
        
        // setup physics for the player
//            self.player.physicsBody = SKPhysicsBody(edgeFrom: <#T##CGPoint#>, to: <#T##CGPoint#>)
//
//            self.player.physicsBody?.categoryBitMask = 1
//            self.player.physicsBody?.collisionBitMask = 4
//            self.player.physicsBody?.contactTestBitMask = 10
        
        
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
        
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if (nodeA == nil || nodeB == nil) {
            return
        }
        
        if (nodeA!.name == "player" && nodeB!.name == "enemy") {
            // player die
            print("RESETTING POSITION-AAAA")
            //restartPlayer()
        }
        if (nodeA!.name == "enemy" && nodeB!.name == "player") {
            print("RESETTING POSITION-BBBBB")
            // player die
        
    }
}
}
