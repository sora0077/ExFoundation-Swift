//
//  Reusable+UICollectionView.swift
//  FoundationSupport
//
//  Created by 林達也 on 2017/12/16.
//  Copyright © 2017年 林達也. All rights reserved.
//

import UIKit

public protocol ReusableSupplementaryView: Reusable {
    static var elementKind: String { get }
}

public protocol ReusableSupplementaryViewNib: ReusableNib, ReusableSupplementaryView {}

public extension UICollectionView {
    func dequeueReusableCell<Cell>(for indexPath: IndexPath) -> Cell where Cell: UICollectionViewCell & Reusable {
        return dequeueReusableCell(withReuseIdentifier: Cell.reusableIdentifier,
                                   for: indexPath) as! Cell  // swiftlint:disable:this force_cast
    }

    // swiftlint:disable:next line_length
    func dequeueReusableSupplementaryView<View>(for indexPath: IndexPath) -> View where View: UICollectionReusableView & ReusableSupplementaryView {
        return dequeueReusableSupplementaryView(ofKind: View.elementKind,
                                                withReuseIdentifier: View.reusableIdentifier,
                                                for: indexPath) as! View  // swiftlint:disable:this force_cast
    }
}

public extension UICollectionView {
    func register(_ types: (UICollectionViewCell & Reusable).Type...) {
        for type in types {
            if let type = type as? ReusableNib.Type {
                register(UINib(nibName: type.nibName, bundle: type.nibBundle),
                         forCellWithReuseIdentifier: type.reusableIdentifier)
            } else {
                register(type, forCellWithReuseIdentifier: type.reusableIdentifier)
            }
        }
    }

    func register(_ types: (UICollectionReusableView & ReusableSupplementaryView).Type...) {
        for type in types {
            if let type = type as? ReusableSupplementaryViewNib.Type {
                register(UINib(nibName: type.nibName, bundle: type.nibBundle),
                         forSupplementaryViewOfKind: type.elementKind,
                         withReuseIdentifier: type.reusableIdentifier)
            } else {
                register(type, forSupplementaryViewOfKind: type.elementKind, withReuseIdentifier: type.reusableIdentifier)
            }
        }
    }
}
