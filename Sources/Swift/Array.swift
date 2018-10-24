//
//  Array.swift
//  FoundationSupport
//
//  Created by 林達也 on 2018/02/08.
//  Copyright © 2018年 林達也. All rights reserved.
//

public extension Sequence {
    func compact<T>() -> [T] where Element == T? {
        return compactMap { $0 }
    }
}

public extension Sequence where Element == Bool {
    func all() -> Bool {
        return allSatisfy { $0 }
    }

    func any() -> Bool {
        return contains(true)
    }
}

public extension Sequence {
    func all(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        return try allSatisfy(predicate)
    }

    func any(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        return try contains(where: predicate)
    }
}
