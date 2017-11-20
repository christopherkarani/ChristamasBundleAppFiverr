//
//  Extensions.swift
//  ChristamasBundleAppFiverr
//
//  Created by Christopher Brandon Karani on 19/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import UIKit

extension CGRect {
    var center: CGPoint {
        get {
            return CGPoint(x: self.midX, y: self.midY)
        }
    }
}
