//
//  ReusableCell+UITableView.swift
//  ExFoundation
//
//  Created by 林達也 on 2017/12/16.
//  Copyright © 2017年 林達也. All rights reserved.
//

import UIKit

public extension UITableView {
    func dequeueReusableCell<Cell>(for indexPath: IndexPath) -> Cell where Cell: UITableViewCell & ReusableCell {
        // swiftlint:disable:next force_cast
        return dequeueReusableCell(withIdentifier: Cell.reusableCellIdentifier, for: indexPath) as! Cell
    }

    func dequeueReusableHeaderFooterView<View>() -> View? where View: UITableViewHeaderFooterView & ReusableCell {
        // swiftlint:disable:next force_cast
        return dequeueReusableHeaderFooterView(withIdentifier: View.reusableCellIdentifier) as! View?
    }
}

public extension UITableView {
    func register(_ types: (UITableViewCell & ReusableCell).Type...) {
        for type in types {
            if let type = type as? ReusableCellXib.Type {
                register(UINib(nibName: type.nibName, bundle: type.nibBundle),
                         forCellReuseIdentifier: type.reusableCellIdentifier)
            } else {
                register(type, forCellReuseIdentifier: type.reusableCellIdentifier)
            }
        }
    }

    func register(_ types: (UITableViewHeaderFooterView & ReusableCell).Type...) {
        for type in types {
            if let type = type as? ReusableCellXib.Type {
                register(UINib(nibName: type.nibName, bundle: type.nibBundle),
                         forHeaderFooterViewReuseIdentifier: type.reusableCellIdentifier)
            } else {
                register(type, forHeaderFooterViewReuseIdentifier: type.reusableCellIdentifier)
            }
        }
    }
}
