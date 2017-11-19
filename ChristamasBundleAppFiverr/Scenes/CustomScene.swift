//
//  CustomScene.swift
//  ChristamasBundleAppFiverr
//
//  Created by Christopher Brandon Karani on 19/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import SpriteKit

class CustomScene : SKScene {
    
    var isLoaded = false
    
    var constantRedStarSize = CGSize(width: 55, height: 55)
    
    var redStarSprites : [SKSpriteNode] = []
    
    lazy var redStarSprite_1: SKSpriteNode = { [unowned self] in
        let sprite = SKSpriteNode(imageNamed: "redStar")
        sprite.name = "redStar_1"
        sprite.position = CGPoint(x: 256, y: 278)
        sprite.size = constantRedStarSize
        return sprite
    }()
    
    lazy var redStarSprite_2: SKSpriteNode = {
        let spritenode = SKSpriteNode(imageNamed: "redStar")
        spritenode.name = "redStar_2"
        spritenode.position = CGPoint(x: 158, y: 460)
        spritenode.size = constantRedStarSize
        return spritenode
    }()
    
    func sceneSetup() {
        guard isLoaded else { return }
        addstars(toScene: redStarSprite_1)
        addstars(toScene: redStarSprite_2)
    }
    
    private func addstars(toScene child: SKSpriteNode) {
        redStarSprites.append(child)
        addChild(child)
        
    }
    
    override func didMove(to view: SKView) {
        isLoaded = true
        setupSceneBackground()
        sceneSetup()
        
        if let redS = self.childNode(withName: "redStar") {
            print(redS.position)
        }
    }
    
    
    fileprivate func setupSceneBackground() {
        let background = SKSpriteNode(imageNamed: "Background")
        background.size = frame.size
        background.position = frame.center
        background.zPosition = -1
        addChild(background)
    }
    var myTouches : [CGPoint] = []
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touches = touches.map { (touch) -> CGPoint in
            let touch = touch.location(in: self)
            myTouches.append(touch)
            return touch
        }
    }
}
