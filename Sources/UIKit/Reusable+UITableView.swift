//
//  Reusable+UITableView.swift
//  FoundationSupport
//
//  Created by 林達也 on 2017/12/16.
//  Copyright © 2017年 林達也. All rights reserved.
//

import UIKit

public extension UITableView {
    func dequeueReusableCell<Cell>(for indexPath: IndexPath) -> Cell where Cell: UITableViewCell & Reusable {
        // swiftlint:disable:next force_cast
        return dequeueReusableCell(withIdentifier: Cell.reusableIdentifier, for: indexPath) as! Cell
    }

    func dequeueReusableHeaderFooterView<View>() -> View? where View: UITableViewHeaderFooterView & Reusable {
        // swiftlint:disable:next force_cast
        return dequeueReusableHeaderFooterView(withIdentifier: View.reusableIdentifier) as! View?
    }
}

public extension UITableView {
    func register(_ types: (UITableViewCell & Reusable).Type...) {
        for type in types {
            if let type = type as? ReusableNib.Type {
                register(UINib(nibName: type.nibName, bundle: type.nibBundle),
                         forCellReuseIdentifier: type.reusableIdentifier)
            } else {
                register(type, forCellReuseIdentifier: type.reusableIdentifier)
            }
        }
    }

    func register(_ types: (UITableViewHeaderFooterView & Reusable).Type...) {
        for type in types {
            if let type = type as? ReusableNib.Type {
                register(UINib(nibName: type.nibName, bundle: type.nibBundle),
                         forHeaderFooterViewReuseIdentifier: type.reusableIdentifier)
            } else {
                register(type, forHeaderFooterViewReuseIdentifier: type.reusableIdentifier)
            }
        }
    }
}
