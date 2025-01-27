//
//  FileResourceLoader.swift
//  Request
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import Foundation
import Request

final class FileResourceLoader: RequestLoaderRepresentable {
    enum Error: Swift.Error {
        case coundNotReadResource(any Swift.Error)
        case notFound
    }
    
    public func loadResponse(for request: FileResource) async throws -> Data {
        guard let path = request.bundle.path(forResource: request.resourceName, ofType: request.fileExtension) else {
            throw Error.notFound
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            return try Data(contentsOf: url)
        } catch {
            throw Error.coundNotReadResource(error)
        }
    }
}
