//
//  FileResourceLoader.swift
//  Request
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import Foundation
import Request

final public class BundleResourceLoader: RequestLoaderRepresentable {
    enum Error: Swift.Error {
        case coundNotReadResource(any Swift.Error)
        case notFound
    }
    
    public init() {
    }
    
    public func loadResponse(for request: BundleResource) async throws -> Data {
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
