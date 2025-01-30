//
//  Request.swift
//  Request
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

public protocol RequestAdapting {
    associatedtype ParameterType
    associatedtype RequestType: Sendable
    associatedtype ResponseType: Sendable
    associatedtype ResultResult
    
    func makeRequest(from parameter: ParameterType) throws -> RequestType
    func parseResponse(response: ResponseType) throws -> ResultResult
}

public protocol ResponseLoading: Sendable {
    associatedtype RequestType
    associatedtype ResponseType
    
    func loadResponse(for request: RequestType) async throws -> ResponseType
}
