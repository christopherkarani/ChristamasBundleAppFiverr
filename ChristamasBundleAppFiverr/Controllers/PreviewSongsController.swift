//
//  PreviewSongsController.swift
//  ChristamasBundleAppFiverr
//
//  Created by Christopher Brandon Karani on 21/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import UIKit
import Magnetic
import SpriteKit
import AVFoundation

class PreviewSongsController : UIViewController {
    var soundfileNames = [String]()
    var magnetic : Magnetic?
    var testAudioNode : SKAudioNode?
    
    func setupMagnetic() {

        let magneticView = MagneticView(frame: view.bounds)
        magnetic = magneticView.magnetic
        view.addSubview(magneticView)
        addNodesToMagnetic()
    }
    
    fileprivate func addNodesToMagnetic() {

        for number in 0 ... 50 {
            let audioNode = AudioNode(text: soundfileNames[number], image: #imageLiteral(resourceName: "bow"), color: .red, radius: 30, audioFileName: soundfileNames[number])
            magnetic?.addChild(audioNode)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
          fileManager()
        setupMagnetic()
      
    }
    
    private func fileManager() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        do {
            let items = try fm.contentsOfDirectory(atPath: path)
            
            for item in items {
                if item.hasSuffix(".m4a") {
                    soundfileNames.append(item)
                }
                
            }
        } catch  {
            print("caught an error")
        }
        
    }
    
    
}

class AudioNode : Node {
    
    override var isSelected: Bool {
        didSet{
            if isSelected {
                addChild(audio)
                audio.run(SKAction.play())
            } else {
                audio.run(SKAction.stop())
                audio.removeFromParent()
            }
        }
    }
    
    override var position: CGPoint {
        didSet(newValue) {
            audio.position = newValue
        }
    }
    var audio : SKAudioNode
    
     init(text: String?, image: UIImage?, color: UIColor, radius: CGFloat, audioFileName: String) {
        audio = SKAudioNode(fileNamed: audioFileName)
        super.init(text: text, image: image, color: color, radius: radius)
        
        audio.autoplayLooped = false
    }
    
    deinit {
        audio.removeAllActions()
        audio.removeFromParent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
