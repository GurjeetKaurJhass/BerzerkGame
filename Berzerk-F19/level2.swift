//
//  level2.swift
//  Berzerk-F19
//
//  Created by Gurjeet kaur on 2019-10-16.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
import SpriteKit

class level2:SKScene, SKPhysicsContactDelegate {
    
    // MARK: Outlets for sprites
    var player:SKSpriteNode!
    let PLAYER_SPEED:CGFloat = 20
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        print("I AM ON LEVEL 2")
        
        // initialze the player
        self.player = self.childNode(withName: "player") as! SKSpriteNode
        // flip the player image
        self.player.xScale = -1;
    }
    
    override func update(_ currentTime: TimeInterval) {
        let playerX = self.player.position.x
        let playerY = self.player.position.y
        moveEnemy(playerXPosition: playerX, playerYPosition: playerY)
    }
    
    func moveEnemy(playerXPosition:CGFloat, playerYPosition:CGFloat) {
        
//        let enemiesArray = self.childNode("enemy")
//        for (int i = 0; i < enemyArray.length; i++) {
//            SKSpriteNode node = enemiesArray(i)
//            node.run(moveLeftAction)
//        }
        
        self.enumerateChildNodes(withName: "enemy") {
            (node, stop) in
            let enemy = node as! SKSpriteNode
            
            // 1. calculate disatnce between player and enemy
            let a = (playerXPosition - enemy.position.x);
            let b = (playerYPosition - enemy.position.y);
            let distance = sqrt((a * a) + (b * b))
            
            // 2. calculate the "rate" to move
            let xn = (a / distance)
            let yn = (b / distance)
            
            // 3. move the enemy
            enemy.position.x = enemy.position.x + (xn * 10);
            enemy.position.y = enemy.position.y + (yn * 10);
        }
    }
    
    
    func restartPlayer() {
        // hide player from screen
        self.player.removeFromParent()
        // restart player in starting position
        player.position = CGPoint(x:1088, y:640)
        // show player again
        addChild(player)
    }
    
    // detect when collision occurs
    func didBegin(_ contact: SKPhysicsContact) {
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if (nodeA == nil || nodeB == nil) {
            return
        }
        
        print("COLLISION DETECTED")
        print("Sprite 1: \(nodeA!.name)")
        print("Sprite 2: \(nodeB!.name)")
        print("------")
        
        if (nodeA!.name == "player" && nodeB!.name == "enemy") {
            // player die
            print("RESETTING POSITION-AAAA")
            restartPlayer()
        }
        if (nodeA!.name == "enemy" && nodeB!.name == "player") {
            print("RESETTING POSITION-BBBBB")
            // player die
            restartPlayer()
        }
        if (nodeA!.name == "exit" && nodeB!.name == "player") {
            print("YOU WIN")
            // show new LEVEL
        }
        if (nodeA!.name == "player" && nodeB!.name == "exit") {
            print("YOU WIN")
            // show new LEVEL
        }

    }
    
    
    // Deal with mouse clicks
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
        //print("Player touched: \(nodeTouched)")
        
        
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
    
    
    
    
    
}
