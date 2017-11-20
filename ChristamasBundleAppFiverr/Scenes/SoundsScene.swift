//
//  SoundsScene.swift
//  ChristamasBundleAppFiverr
//
//  Created by Christopher Brandon Karani on 20/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import SpriteKit
import Magnetic

class SoundsScene: Magnetic {
    
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        magneticDelegate = self
        backgroundColor = .cyan
    }
    
    
}

extension SoundsScene: MagneticDelegate {
    func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
        
    }
    
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        
    }
    
    
}
