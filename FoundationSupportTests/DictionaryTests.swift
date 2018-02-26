//
//  DictionaryTests.swift
//  FoundationSupportTests
//
//  Created by 林達也 on 2018/02/26.
//  Copyright © 2018年 林達也. All rights reserved.
//

import XCTest
import FoundationSupport

class DictionaryTests: XCTestCase {
    func test_plus() {
        XCTAssertEqual(["a": 1, "b": 2] + ["c": 3], ["a": 1, "b": 2, "c": 3])
    }

    func test_compactMap() {
        XCTAssertEqual(["a": 1, "b": nil].compactValues(), ["a": 1])
    }
}
