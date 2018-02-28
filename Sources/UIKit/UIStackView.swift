//
//  UIStackView.swift
//  FoundationSupport
//
//  Created by 林達也 on 2018/02/28.
//  Copyright © 2018年 林達也. All rights reserved.
//

import UIKit
import FoundationSupport

public extension UIStackView {
    func addArrangedSubview(_ views: [UIView?]) {
        views.compact().forEach(addArrangedSubview)
    }

    func addArrangedSubview(_ views: UIView?...) {
        addArrangedSubview(views)
    }
}
