//
//  Cache.swift
//  Cache
//
//  Created by Mohammadreza Hemmati on 1/27/25.
//

import Foundation

public protocol CacheKey: Sendable {
    var cacheKey: Data { get }
}

extension URL: CacheKey {
    public var cacheKey: Data {
        return dataRepresentation
    }
}

public protocol Cache: Sendable {
    func readData(for key: any CacheKey) async throws -> Data?
    func save(data: Data, for key: any CacheKey) async throws
}
