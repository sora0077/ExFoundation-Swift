//
//  Dictionary.swift
//  FoundationSupport
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
    func mapKeys<NewKey: Hashable>(_ transform: (Key) throws -> NewKey) rethrows -> [NewKey: Value] {
        return try reduce(into: [NewKey: Value](minimumCapacity: underestimatedCount)) {
            $0[try transform($1.key)] = $1.value
        }
    }

    func compactMapValues<NewValue>(_ transform: (Value) throws -> NewValue?) rethrows -> [Key: NewValue] {
        return try reduce(into: [Key: NewValue](minimumCapacity: underestimatedCount)) {
            $0[$1.key] = try transform($1.value)
        }
    }

    func compactValues<NewValue>() -> [Key: NewValue] where Value == NewValue? {
        return compactMapValues { $0 }
    }
}

public extension Dictionary {
    func mapValues<NewValue>(_ keyPath: KeyPath<Value, NewValue>) -> [Key: NewValue] {
        return mapValues { $0[keyPath: keyPath] }
    }

    func mapKeys<NewKey: Hashable>(_ keyPath: KeyPath<Key, NewKey>) -> [NewKey: Value] {
        return mapKeys { $0[keyPath: keyPath] }
    }

    func compactMapValues<NewValue>(_ keyPath: KeyPath<Value, NewValue?>) -> [Key: NewValue] {
        return compactMapValues { $0[keyPath: keyPath] }
    }
}
