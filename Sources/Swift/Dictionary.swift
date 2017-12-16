//
//  Dictionary.swift
//  ExFoundation
//
//  Created by 林達也 on 2017/12/16.
//  Copyright © 2017年 林達也. All rights reserved.
//

public extension Dictionary {
    static func + (lhs: Dictionary, rhs: Dictionary) -> Dictionary {
        return lhs.merging(rhs, uniquingKeysWith: { _, new in new })
    }

    static func += (lhs: inout Dictionary, rhs: Dictionary) {
        lhs = lhs + rhs
    }
}

extension Dictionary where Value: OptionalType {
    var cleaned: [Key: Value.WrappedType] {
        return filter { _, value in value.unwrapped != nil }.mapValues { $0.unsafelyUnwrapped }
    }
}
