//
//  CommonCrypto.swift
//  ExFoundation
//
//  Created by 林達也 on 2018/02/11.
//  Copyright © 2018年 林達也. All rights reserved.
//

@_exported import CommonCrypto

public typealias CryptoHash = (_ data: UnsafeRawPointer?, _ len: CC_LONG, _ md: UnsafeMutablePointer<UInt8>?) -> UnsafeMutablePointer<UInt8>?

public extension Data {
    static func digest(_ hash: @escaping CryptoHash, length: Int32) -> (_ input: Data) -> Data {
        return { input in
            var buffer = Data(count: Int(length))
            _ = buffer.withUnsafeMutableBytes { buffer in
                input.withUnsafeBytes {
                    hash($0, CC_LONG(input.count), buffer)
                }
            }
            return buffer
        }
    }
}

public extension String {
    static func digest(_ hash: @escaping CryptoHash, length: Int32) -> (_ input: String?) -> String? {
        return { input in
            input?.data(using: .utf8)
                .map(Data.digest(hash, length: length))?
                .map { String(format: "%02hhx", $0) }
                .joined()
        }
    }
}
