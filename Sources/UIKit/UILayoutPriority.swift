//
//  UILayoutPriority.swift
//  ExFoundation
//
//  Created by 林達也 on 2018/02/14.
//  Copyright © 2018年 林達也. All rights reserved.
//

import UIKit
import ExFoundation

public extension UILayoutPriority {
    static func + (lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority {
        let new = UILayoutPriority(rawValue: lhs.rawValue + rhs)
        precondition(new.rawValue.contains(in: 0...UILayoutPriority.required.rawValue))
        return new
    }

    static func - (lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority {
        let new = UILayoutPriority(rawValue: lhs.rawValue - rhs)
        precondition(new.rawValue.contains(in: 0...UILayoutPriority.required.rawValue))
        return new
    }
}
