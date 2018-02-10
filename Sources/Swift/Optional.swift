//
//  Optional.swift
//  ExFoundation
//
//  Created by 林達也 on 2017/12/16.
//  Copyright © 2017年 林達也. All rights reserved.
//

public extension Optional where Wrapped: StringProtocol {
    var isEmpty: Bool {
        switch self {
        case .some(let str): return str.isEmpty
        case .none: return true
        }
    }
}

public extension Optional where Wrapped: Collection {
    var isEmpty: Bool {
        switch self {
        case .some(let c): return c.isEmpty
        case .none: return true
        }
    }
}
