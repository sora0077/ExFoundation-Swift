//
//  Array.swift
//  ExFoundation
//
//  Created by 林達也 on 2018/02/08.
//  Copyright © 2018年 林達也. All rights reserved.
//

public extension Sequence {
    func compactMap<T>() -> [T] where Element == T? {
        return flatMap { $0 }
    }
}
