//
//  CachingImageLoader.swift
//  CachingImageLoader
//
//  Created by Mohammadreza Hemmati on 1/27/25.
//

import ImageLoader
import Cache
import UIKit
import Foundation

public protocol DataLoader: Sendable {
    func loadData(for request: URLRequest) async throws -> Data
}

extension URLSession: DataLoader {
    public func loadData(for request: URLRequest) async throws -> Data {
        return try await data(for: request).0
    }
}
    
public actor CachingImageLoader: ImageLoader {
    struct ImageRequest: Hashable {
        let url: URL
        let scale: CGFloat
    }
    
    private let dataLoader: DataLoader
    private let cache: Cache
    
    private var pendingImageRequests: [ImageRequest: Int] = [:]
    private var runningImageTasks: [ImageRequest: Task<UIImage, Error>] = [:]
    
    public init(apiRequstLoader: DataLoader = URLSession.shared, cache: Cache) {
        self.dataLoader = apiRequstLoader
        self.cache = cache
    }
    
    public func loadImage(url: URL, scale: CGFloat) async throws -> UIImage {
        let request = ImageRequest(url: url, scale: scale)
        pendingImageRequests[request] = pendingImageRequests[request, default: 0] + 1
        defer {
            guard let count = pendingImageRequests[request] else { fatalError() }
            if count == 1 {
                pendingImageRequests[request] = nil
                runningImageTasks[request] = nil
            } else {
                pendingImageRequests[request] = count - 1
            }
        }
        if let task = runningImageTasks[request] {
            return try await task.value
        } else {
            let task = imageTask(request: request)
            runningImageTasks[request] = task
            return try await task.value
        }
    }
    
    private func imageTask(request: ImageRequest) -> Task<UIImage, Error> {
        return Task {
            if let data = try? await self.cache.readData(for: request.url) {
                return try self.image(from: data, scale: request.scale)
            } else {
                let data = try await self.loadData(from: request.url)
                try Task.checkCancellation()
                let image = try self.image(from: data, scale: request.scale)
                // TODO: move the best effort policy as a parameter
                try? await self.cache.save(data: data, for: request.url)
                return image
            }
        }
    }
    
    
    private nonisolated func image(from data: Data, scale: CGFloat) throws -> UIImage {
        guard let image = UIImage(data: data, scale: scale) else {
            throw ImageLoaderError.couldNotConvertDataToImage
        }
        return image
    }
    
    private nonisolated func loadData(from url: URL) async throws -> Data {
        do {
            return try await dataLoader.loadData(for: URLRequest(url: url))
        } catch {
            throw ImageLoaderError.couldNotLoadData(error)
        }
    }
}
