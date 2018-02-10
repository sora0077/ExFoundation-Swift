//
//  UIView.swift
//  ExFoundation
//
//  Created by 林達也 on 2018/02/08.
//  Copyright © 2018年 林達也. All rights reserved.
//

import UIKit
import ExFoundation

public extension UIView {
    func addSubview(_ views: UIView?...) {
        views.compactMap().forEach(addSubview)
    }
}
