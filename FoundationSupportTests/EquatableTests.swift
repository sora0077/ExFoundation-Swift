//
//  EquatableTests.swift
//  FoundationSupportTests
//
//  Created by 林達也 on 2018/02/26.
//  Copyright © 2018年 林達也. All rights reserved.
//

import XCTest
import FoundationSupport

class EquatableTests: XCTestCase {
    func test_contains() {
        XCTAssertTrue(1.contains(in: [1, 2]))
    }

    func test_notContains() {
        XCTAssertFalse(1.contains(in: [2, 3]))
    }

    func test_range_contains() {
        XCTAssertTrue(1.contains(in: 1...2))
    }

    func test_range_notContains() {
        XCTAssertFalse(1.contains(in: 2...3))
    }
}
