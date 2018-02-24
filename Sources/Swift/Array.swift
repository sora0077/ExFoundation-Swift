//
//  Array.swift
//  ExFoundation
//
//  Created by 林達也 on 2018/02/08.
//  Copyright © 2018年 林達也. All rights reserved.
//

public extension Sequence {
    func compact<T>() -> [T] where Element == T? {
        #if swift(>=4.1)
            return compactMap { $0 }
        #else
            return flatMap { $0 }
        #endif
    }
}

public extension Sequence where Element == Bool {
    func all() -> Bool {
        return ExFoundation.all(self)
    }

    func any() -> Bool {
        return ExFoundation.any(self)
    }
}

public extension Sequence {
    func all(_ transform: (Element) throws -> Bool) rethrows -> Bool {
        return try ExFoundation.all(self, transform)
    }

    func any(_ transform: (Element) throws -> Bool) rethrows -> Bool {
        return try ExFoundation.any(self, transform)
    }
}
