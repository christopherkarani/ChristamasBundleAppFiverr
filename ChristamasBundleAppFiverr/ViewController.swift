//
//  ViewController.swift
//  ChristamasBundleAppFiverr
//
//  Created by Christopher Brandon Karani on 17/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import UIKit
import Magnetic
import SpriteKit

class ViewController: UIViewController {

    var scene : CustomScene!

    func setupCustomScene() {
        
        let spritekitView = SKView(frame: view.bounds)
        scene = CustomScene(size: spritekitView.frame.size)
        scene.scaleMode = .aspectFill
        spritekitView.presentScene(scene)
        view.addSubview(spritekitView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomScene()
        navigationbarSetup()
    }
    
    fileprivate func navigationbarSetup () {
        navigationController?.navigationBar.isHidden = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

