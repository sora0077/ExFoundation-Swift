//
//  UIColor.swift
//  FoundationSupport
//
//  Created by 林達也 on 2018/02/13.
//  Copyright © 2018年 林達也. All rights reserved.
//

import UIKit

public extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255,
                  green: CGFloat((hex & 0x00FF00) >> 8) / 255,
                  blue: CGFloat(hex & 0x0000FF) / 255,
                  alpha: alpha)
    }
}
