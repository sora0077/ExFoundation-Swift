//
//  Optional.swift
//  ExFoundation
//
//  Created by 林達也 on 2017/12/16.
//  Copyright © 2017年 林達也. All rights reserved.
//

// for generics constraint
public protocol OptionalType {
    associatedtype WrappedType

    var unsafelyUnwrapped: WrappedType { get }
    var unwrapped: WrappedType? { get }
}

extension Optional: OptionalType {
    public typealias WrappedType = Wrapped
    public var unwrapped: Wrapped? { return self }
}

public extension Optional where Wrapped == String {
    var isEmpty: Bool {
        switch self {
        case .some(let str): return str.isEmpty
        case .none: return true
        }
    }
}
