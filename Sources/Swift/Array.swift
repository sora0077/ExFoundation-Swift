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
        return FoundationSupport.all(self)
    }

    func any() -> Bool {
        return FoundationSupport.any(self)
    }
}

public extension Sequence {
    func all(_ transform: (Element) throws -> Bool) rethrows -> Bool {
        return try FoundationSupport.all(self, transform)
    }

    func any(_ transform: (Element) throws -> Bool) rethrows -> Bool {
        return try FoundationSupport.any(self, transform)
    }
}
