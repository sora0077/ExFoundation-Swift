//
//  Equatable.swift
//  ExFoundation
//
//  Created by 林達也 on 2017/12/16.
//  Copyright © 2017年 林達也. All rights reserved.
//

extension Equatable {
    public func contains(in values: Self...) -> Bool {
        return values.contains(self)
    }

    public func contains<S: Sequence>(in values: S) -> Bool where S.Element == Self {
        return values.contains(self)
    }
}
