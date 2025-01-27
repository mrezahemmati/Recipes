//
//  MemoryCache.swift
//  Cache
//
//  Created by Mohammadreza Hemmati on 1/27/25.
//

import Foundation
import Cache

public actor MemoryCache: Cache {
    private var storage: [Data: Data] = [:]
    
    public func readData(for key: any CacheKey) async throws -> Data? {
        return storage[key.cacheKey]
    }
    
    public func save(data: Data, for key: any CacheKey) async throws {
        storage[key.cacheKey] = data
    }
}
