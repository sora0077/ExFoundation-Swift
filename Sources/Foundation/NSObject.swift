//
//  NSObject.swift
//  ExFoundation
//
//  Created by 林達也 on 2017/12/16.
//  Copyright © 2017年 林達也. All rights reserved.
//

import Foundation

extension NSObjectProtocol {
    public func apply(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}
