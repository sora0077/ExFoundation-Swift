//
//  Bool.swift
//  FoundationSupport
//
//  Created by 林達也 on 2017/12/25.
//  Copyright © 2017年 林達也. All rights reserved.
//

public extension Bool {
    func toggled() -> Bool {
        return !self
    }
}

// MARK: - all
public func all<S: Sequence>(_ seq: S, _ predicate: (S.Element) throws -> Bool) rethrows -> Bool {
    return try seq.all(predicate)
}

public func all<S: Sequence>(_ seq: S) -> Bool where S.Element == Bool {
    return seq.all()
}

public func all(_ values: Bool...) -> Bool {
    return values.all()
}

// MARK: - any
public func any<S: Sequence>(_ seq: S, _ predicate: (S.Element) throws -> Bool) rethrows -> Bool {
   return try seq.any(predicate)
}

public func any<S: Sequence>(_ seq: S) -> Bool where S.Element == Bool {
    return seq.any()
}

public func any(_ values: Bool...) -> Bool {
    return values.any()
}
