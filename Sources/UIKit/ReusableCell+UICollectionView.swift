//
//  ReusableCell+UICollectionView.swift
//  ExFoundation
//
//  Created by 林達也 on 2017/12/16.
//  Copyright © 2017年 林達也. All rights reserved.
//

import UIKit

public protocol ReusableSupplementaryView: ReusableCell {
    static var elementKind: String { get }
}

public protocol ReusableSupplementaryViewXib: ReusableCellXib, ReusableSupplementaryView {}

public extension UICollectionView {
    func dequeueReusableCell<Cell>(for indexPath: IndexPath) -> Cell where Cell: UICollectionViewCell & ReusableCell {
        return dequeueReusableCell(withReuseIdentifier: Cell.cellIdentifier,
                                   for: indexPath) as! Cell  // swiftlint:disable:this force_cast
    }

    // swiftlint:disable:next line_length
    func dequeueReusableSupplementaryView<View>(ofKind elementKind: String, for indexPath: IndexPath) -> View where View: UICollectionReusableView & ReusableSupplementaryView {
        return dequeueReusableSupplementaryView(ofKind: elementKind,
                                                withReuseIdentifier: View.cellIdentifier,
                                                for: indexPath) as! View  // swiftlint:disable:this force_cast
    }
}

public extension UICollectionView {
    func register(_ types: (UICollectionViewCell & ReusableCell).Type...) {
        for type in types {
            if let type = type as? ReusableCellXib.Type {
                register(UINib(nibName: type.nibName, bundle: type.nibBundle),
                         forCellWithReuseIdentifier: type.cellIdentifier)
            } else {
                register(type, forCellWithReuseIdentifier: type.cellIdentifier)
            }
        }
    }

    func register(_ types: (UICollectionReusableView & ReusableSupplementaryView).Type...) {
        for type in types {
            if let type = type as? ReusableSupplementaryViewXib.Type {
                register(UINib(nibName: type.nibName, bundle: type.nibBundle),
                         forSupplementaryViewOfKind: type.elementKind,
                         withReuseIdentifier: type.cellIdentifier)
            } else {
                register(type, forSupplementaryViewOfKind: type.elementKind, withReuseIdentifier: type.cellIdentifier)
            }
        }
    }
}
