//
//  CustomScene.swift
//  ChristamasBundleAppFiverr
//
//  Created by Christopher Brandon Karani on 19/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import SpriteKit
import GameplayKit
import Magnetic

let constantRedStarSize = CGSize(width: 45, height: 45)
let smallRedStarSize = CGSize(width: 20, height: 20)
let constantGoldStarSize = CGSize(width: 55, height: 55)
let largeStarSize = CGSize(width: 70, height: 70)

enum StarColor {
    case red
    case gold
    case largeStar
}

class CustomScene : SKScene {
    var magneticDelegate : MagneticDelegate?
    var isLoaded = false
    
    var magnetic : Magnetic?
    
    var redStarSprites : [SKSpriteNode] = []
    var goldStarSprites: [SKSpriteNode] = []
    var largeStarSprties: [SKSpriteNode] = []
    
     var smallRedStarSprite_1: SKSpriteNode = {
        let sprite = SKSpriteNode(imageNamed: "redStar")
        sprite.name = "redStar_1"
        sprite.position = CGPoint(x: 160, y: 526)
        sprite.size = smallRedStarSize
        return sprite
    }()
    
     var redStarSprite_2: SKSpriteNode = {
        let spritenode = SKSpriteNode(imageNamed: "redStar")
        spritenode.name = "redStar_2"
        spritenode.position = CGPoint(x: 158, y: 460)
        spritenode.size = constantRedStarSize
        return spritenode
    }()
    
    var smallRedStarSprite_3: SKSpriteNode = {
        let spritenode = SKSpriteNode(imageNamed: "redStar")
        spritenode.name = "redStar_3"
        spritenode.position = CGPoint(x: 230, y: 422)
        spritenode.size = smallRedStarSize
        return spritenode
    }()
    
    var smallRedStarSprite_4: SKSpriteNode = {
        let spritenode = SKSpriteNode(imageNamed: "redStar")
        spritenode.name = "redStar_3"
        spritenode.position = CGPoint(x: 155, y: 397)
        spritenode.size = smallRedStarSize
        return spritenode
    }()
    
    var goldStar_1: SKSpriteNode = {
        let goldStar = SKSpriteNode(imageNamed: "goldStar")
        goldStar.name = "goldStar_1"
        goldStar.size = constantGoldStarSize
        goldStar.position = CGPoint(x: 121, y: 350)
        return goldStar
    }()
    
    var goldStar_2: SKSpriteNode = {
        let goldStar = SKSpriteNode(imageNamed: "goldStar")
        goldStar.name = "goldStar_2"
        goldStar.size = constantGoldStarSize
        goldStar.position = CGPoint(x: 230, y: 500)
        return goldStar
    }()
    
    var goldStar_3: SKSpriteNode = {
        let goldStar = SKSpriteNode(imageNamed: "goldStar")
        goldStar.name = "goldStar_3"
        goldStar.size = constantGoldStarSize
        goldStar.position = CGPoint(x: 240, y: 367)
        return goldStar
    }()
    
    var largeStar: SKSpriteNode = {
        let sprite = SKSpriteNode(imageNamed: "christmas_star")
        sprite.name = "largeStar"
        sprite.size = largeStarSize
        sprite.position = CGPoint(x: 185, y: 620)
        return sprite
    }()
    
    let containerViewSize = CGSize(width: UIScreen.main.bounds.width, height: 130)
    var containerView : UIView = {
        let node = UIView()
        node.backgroundColor = .clear
        node.translatesAutoresizingMaskIntoConstraints = false
        return node
    }()
    
    
    
    fileprivate func containerViewSetup() {
    
        let containerViewposition = CGPoint(x: view!.frame.midX, y: 255)
        view?.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: view!.centerXAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view!.bottomAnchor, constant: -220).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        let magneticView = MagneticView(frame: containerView.frame)
        containerView.addSubview(magneticView)
        
        magneticView.translatesAutoresizingMaskIntoConstraints = false
        
        magneticView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        magneticView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        magneticView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        magneticView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        magneticView.backgroundColor = .clear
        
        magnetic = magneticView.magnetic
        
        let node = Node(text: "Purchase", image: nil, color: .red, radius: 40)
        magnetic?.addChild(node)
        magnetic?.view?.backgroundColor = .clear
        magnetic?.backgroundColor = .clear
  
    }
    
    
    func sceneSetup() {
        guard isLoaded else { return }
        addstars(toScene: smallRedStarSprite_1, withType: .red)
        addstars(toScene: redStarSprite_2, withType: .red)
        addstars(toScene: smallRedStarSprite_3, withType: .red)
        addstars(toScene: smallRedStarSprite_4, withType: .red)
        addstars(toScene: goldStar_1, withType: .gold)
        addstars(toScene: goldStar_2, withType: .gold)
        addstars(toScene: goldStar_3, withType: .gold)
        addstars(toScene: largeStar, withType: .largeStar)
        redStarRotation()
        runLargeStarAction()
        containerViewSetup()
    }
    
    private func addstars(toScene child: SKSpriteNode, withType color: StarColor) {
        switch color {
        case .red:
            redStarSprites.append(child)
        case .gold:
            goldStarSprites.append(child)
        case .largeStar:
            largeStarSprties.append(child)
        }
        addChild(child)
        
    }
    
    override func didMove(to view: SKView) {
        magneticDelegate = self
        isLoaded = true
        setupSceneBackground()
        sceneSetup()
        
        if let redS = self.childNode(withName: "redStar") {
            print(redS.position)
        }
    }
    
    
    
    private func redStarRotation() {
        
    
        for sprite in redStarSprites {
            runRotationAction(onSprite: sprite)
        }
        
        for sprite in goldStarSprites {
            runRotationAction(onSprite: sprite)
        }
    }
    
    fileprivate func runRotationAction(onSprite sprite: SKSpriteNode) {
        let angle1 = CGFloat(Double.pi / 2)
        let angle2 = CGFloat(Double.pi)
        
        let randomWaitInterval = GKRandomDistribution(lowestValue: 1, highestValue: 2).nextInt()
        
        let waitAtion = SKAction.wait(forDuration: TimeInterval(randomWaitInterval))
        
        let actionOne = SKAction.rotate(byAngle: angle1, duration: 10)
        let actionTwo = SKAction.rotate(byAngle: angle2, duration: 15)
        
        
        let actions = SKAction.sequence([actionOne, waitAtion, actionTwo])
        sprite.run(SKAction.repeatForever(actions))
        
    }
    
    fileprivate func runLargeStarAction() {
        let scaleBy: CGFloat = 1.5
        let action = SKAction.scale(by: scaleBy, duration: 0.7)
        let action2 = action.reversed()
        let waitAction = SKAction.wait(forDuration: 3)
        let actionSequence = SKAction.sequence([action, action2, waitAction])
        largeStar.run(SKAction.repeatForever(actionSequence))
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
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

extension CustomScene: MagneticDelegate {
    func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
        print(node)
    }
    
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        print(node)
    }
}
