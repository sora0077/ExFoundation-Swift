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
        return dequeueReusableCell(withIdentifier: Cell.cellIdentifier, for: indexPath) as! Cell
    }

    func dequeueReusableHeaderFooterView<View>() -> View? where View: UITableViewHeaderFooterView & ReusableCell {
        // swiftlint:disable:next force_cast
        return dequeueReusableHeaderFooterView(withIdentifier: View.cellIdentifier) as! View?
    }
}

public extension UITableView {
    func register(_ types: (UITableViewCell & ReusableCell).Type...) {
        for type in types {
            register(type, forCellReuseIdentifier: type.cellIdentifier)
        }
    }

    func register(_ types: (UITableViewHeaderFooterView & ReusableCell).Type...) {
        for type in types {
            register(type, forHeaderFooterViewReuseIdentifier: type.cellIdentifier)
        }
    }

    // MARK: -
    func register(_ types: (UITableViewCell & ReusableCellXib).Type...) {
        for type in types {
            register(UINib(nibName: type.nibName, bundle: type.nibBundle),
                     forCellReuseIdentifier: type.cellIdentifier)
        }
    }

    func register(_ types: (UITableViewHeaderFooterView & ReusableCellXib).Type...) {
        for type in types {
            register(UINib(nibName: type.nibName, bundle: type.nibBundle),
                     forHeaderFooterViewReuseIdentifier: type.cellIdentifier)
        }
    }
}
