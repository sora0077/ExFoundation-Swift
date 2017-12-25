//
//  NSRange.swift
//  ExFoundation
//
//  Created by 林達也 on 2017/12/25.
//  Copyright © 2017年 林達也. All rights reserved.
//

import Foundation

public extension String {
    func nsRange<Str: StringProtocol>(of sub: Str) -> NSRange? {
        return range(of: sub).map { NSRange($0, in: self) }
    }

    func nsRange() -> NSRange {
        return NSRange(startIndex..<endIndex, in: self)
    }
}

public extension Substring {
    func nsRange<Str: StringProtocol>(of sub: Str) -> NSRange? {
        return range(of: sub).map { NSRange($0, in: self) }
    }

    func nsRange() -> NSRange {
        return NSRange(startIndex..<endIndex, in: self)
    }
}
