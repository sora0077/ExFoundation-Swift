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
        lhs = lhs + rhs  // swiftlint:disable:this shorthand_operator
    }
}

public extension Dictionary {
    func compactValues<T>(_ transform: (Element) throws -> Value) rethrows -> [Key: T] where Value == T? {
        return try reduce(into: [Key: T](minimumCapacity: count)) {
            if let value = try transform($1) {
                $0[$1.key] = value
            }
        }
    }

    func compactValues<T>() -> [Key: T] where Value == T? {
        return compactValues { $0.value }
    }
}
