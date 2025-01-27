//
//  Request.swift
//  Request
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

public protocol RequestRepresentable {
    associatedtype ParameterType
    associatedtype RequestType
    associatedtype ResponseType
    associatedtype ResultResult
    
    func makeRequest(from parameter: ParameterType) throws -> RequestType
    func parseResponse(response: ResponseType) throws -> ResultResult
}

public protocol RequestLoaderRepresentable {
    associatedtype RequestType
    associatedtype ResponseType
    
    func loadResponse(for request: RequestType) async throws -> ResponseType
}
