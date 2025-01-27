//
//  BundleResourceRequest.swift
//  Request
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import Foundation
import Request

public struct BundleResource: Sendable {
    public let bundle: Bundle
    public let resourceName: String
    public let fileExtension: String
    
    public init(bundle: Bundle = .main, resourceName: String, fileExtension: String) {
        self.bundle = bundle
        self.resourceName = resourceName
        self.fileExtension = fileExtension
    }
}

protocol BundleResourceRequestRepresentable: RequestAdapting {
    associatedtype RequestType = BundleResource
    associatedtype ResponseType = Data
}

public class BundleResourceRequest<T: Decodable>: BundleResourceRequestRepresentable {
    public init() {}
    
    public func makeRequest(from input: BundleResource) throws -> BundleResource {
        return input
    }
    
    public func parseResponse(response: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: response)
    }
}
