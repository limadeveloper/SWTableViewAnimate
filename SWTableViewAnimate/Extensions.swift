//
//  Extensions.swift
//  SWTableViewAnimate
//
//  Created by John Lima on 08/10/16.
//  Copyright © 2016 limadeveloper. All rights reserved.
//

import UIKit

extension CGFloat {
    
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
}

extension UIColor {

    static func randomColor() -> UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0)
    }
    
}
