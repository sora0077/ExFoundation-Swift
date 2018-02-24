//
//  Reusable.swift
//  FoundationSupport
//
//  Created by 林達也 on 2017/12/16.
//  Copyright © 2017年 林達也. All rights reserved.
//

import UIKit

public protocol Reusable {
    static var reusableIdentifier: String { get }
}

public extension Reusable {
    static var reusableIdentifier: String { return String(describing: self) }
}

//

public protocol ReusableNib: Reusable {
    static var nibName: String { get }
    static var nibBundle: Bundle? { get }
}

public extension ReusableNib {
    static var nibName: String { return reusableIdentifier }
    static var nibBundle: Bundle? { return nil }
}
