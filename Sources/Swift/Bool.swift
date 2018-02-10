//
//  Bool.swift
//  ExFoundation
//
//  Created by 林達也 on 2017/12/25.
//  Copyright © 2017年 林達也. All rights reserved.
//

public extension Bool {
    mutating func toggle() {
        self = !self
    }

    func toggled() -> Bool {
        return !self
    }
}

// MARK: - all
public func all<S: Sequence>(_ seq: S, _ transform: (S.Element) throws -> Bool) rethrows -> Bool {
    for s in seq {
        if try !transform(s) {
            return false
        }
    }
    return true
}

public func all<S: Sequence>(_ seq: S) -> Bool where S.Element == Bool {
    return all(seq, { $0 })
}

public func all(_ values: Bool...) -> Bool {
    return all(values)
}

// MARK: - any
public func any<S: Sequence>(_ seq: S, _ transform: (S.Element) throws -> Bool) rethrows -> Bool {
    for s in seq {
        if try transform(s) {
            return true
        }
    }
    return false
}

public func any<S: Sequence>(_ seq: S) -> Bool where S.Element == Bool {
    return any(seq, { $0 })
}

public func any(_ values: Bool...) -> Bool {
    return any(values)
}
