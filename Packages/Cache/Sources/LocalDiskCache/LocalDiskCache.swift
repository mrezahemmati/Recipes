//
//  LocalDiskCache.swift
//  Cache
//
//  Created by Mohammadreza Hemmati on 1/27/25.
//

import Foundation
import Cache

func getCacheDirectory() -> URL {
    let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

public actor LocalDiskCache: Cache {
    private let fileManager: FileManager
    private let rootDirectory: URL
    
    public init() {
        self.init(rootDirectory: getCacheDirectory())
    }
    
    public init(fileManager: FileManager = .default, rootDirectory: URL) {
        self.fileManager = fileManager
        self.rootDirectory = rootDirectory
    }
    
    public func readData(for key: any CacheKey) throws -> Data? {
        let fileUrl = fileUrl(for: key)
        guard fileManager.fileExists(atPath: fileUrl.path) else {
            return nil
        }
        return try Data(contentsOf: fileUrl)
    }
    
    public func save(data: Data, for key: any CacheKey) throws {
        let fileUrl = fileUrl(for: key)
        try data.write(to: fileUrl)
    }
    
    private func fileUrl(for key: any CacheKey) -> URL {
        let path = key.cacheKey.base64EncodedString()
        if #available(iOS 16.0, *) {
            return URL(filePath: path, relativeTo: rootDirectory)
        } else {
            // Fallback on earlier versions
            return rootDirectory.appendingPathComponent(path)
        }
    }
}
