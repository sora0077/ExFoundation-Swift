//
//  BoolTests.swift
//  FoundationSupportTests
//
//  Created by 林達也 on 2018/02/26.
//  Copyright © 2018年 林達也. All rights reserved.
//

import XCTest
import FoundationSupport

class BoolTests: XCTestCase {
    func test_all() {
        XCTAssertTrue(all(true, true, true))
        XCTAssertFalse(all(true, false, true))
    }

    func test_any() {
        XCTAssertTrue(any(true, false, true))
        XCTAssertFalse(any(false, false, false))
    }
}
