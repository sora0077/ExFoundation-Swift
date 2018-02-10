//
//  ReusableCell.swift
//  ExFoundation
//
//  Created by 林達也 on 2017/12/16.
//  Copyright © 2017年 林達也. All rights reserved.
//

import UIKit

public protocol ReusableCell {
    static var reusableCellIdentifier: String { get }
}

public extension ReusableCell {
    static var reusableCellIdentifier: String { return String(describing: self) }
}

//

public protocol ReusableCellXib: ReusableCell {
    static var nibName: String { get }
    static var nibBundle: Bundle? { get }
}

public extension ReusableCellXib {
    static var nibName: String { return reusableCellIdentifier }
    static var nibBundle: Bundle? { return nil }
}
