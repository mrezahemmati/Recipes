//
//  FileSystemRequest.swift
//  Request
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import Foundation
import Request

public struct FileResource {
    public let bundle: Bundle
    public let resourceName: String
    public let fileExtension: String
    
    public init(bundle: Bundle = .main, resourceName: String, fileExtension: String) {
        self.bundle = bundle
        self.resourceName = resourceName
        self.fileExtension = fileExtension
    }
}

protocol FileSystemRequestRepresentable: RequestRepresentable {
    associatedtype RequestType = FileResource
    associatedtype ResponseType = Data
}

public class FileSystemRequest<T: Decodable>: FileSystemRequestRepresentable {
    public init() {}
    
    public func makeRequest(from input: FileResource) throws -> FileResource {
        return input
    }
    
    public func parseResponse(response: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: response)
    }
}
