//
//  HTTPRequest.swift
//  Request
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import Foundation
import Request

protocol HTTPRequestRepresentable: RequestAdapting {
    associatedtype RequestType = URLRequest
    associatedtype ResponseType = (Data, URLResponse)
}

public class HTTPRequest<T: Decodable>: HTTPRequestRepresentable {
    public init() {
        
    }
    
    public func makeRequest(from url: URL) throws -> URLRequest {
        return URLRequest(url: url)
    }
    
    public func parseResponse(response: (Data, URLResponse)) throws -> T {
        return try JSONDecoder().decode(T.self, from: response.0)
    }
}
