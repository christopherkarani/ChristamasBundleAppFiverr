//
//  Emitter.swift
//  ChristamasBundleAppFiverr
//
//  Created by Christopher Brandon Karani on 20/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import UIKit

class Emitter {
    static func startEmission(withImage image: UIImage) -> CAEmitterLayer {
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterShape = kCAEmitterLayerLine
        emitterLayer.emitterCells = emitterCellSetup(withImage: image)
        return emitterLayer
    }
    
    static func emitterCellSetup(withImage image: UIImage) -> [CAEmitterCell] {
        var cellsArray = [CAEmitterCell]()
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.birthRate = 1
        cell.velocity = CGFloat(25)
        cell.lifetime = 50
        cell.emissionLongitude = (180 * (.pi/180))
        cell.emissionRange = (45 * (.pi/180))
        cell.scale = 0.03
        cell.scaleRange = 0.03
        cellsArray.append(cell)
        return cellsArray
    }
}
