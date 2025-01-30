//
//  URLSession+RequestLoader.swift
//  Request
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import Request
import Foundation

extension URLSession: ResponseLoading {
    public func loadResponse(for request: URLRequest) async throws -> (Data, URLResponse) {
        if #available(iOS 15.0, *) {
            return try await data(for: request)
        } else {
            return try await withCheckedThrowingContinuation { continuation in
                let task = dataTask(with: request) { data, response, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else if let data = data, let response = response {
                        continuation.resume(returning: (data, response))
                    } else {
                        fatalError()
                    }
                }
                task.resume()
            }
        }
    }
}
