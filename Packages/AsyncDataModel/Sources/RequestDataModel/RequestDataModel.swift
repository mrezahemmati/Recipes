//
//  RequestDataModel.swift
//  AsyncDataModel
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import Request
import AsyncDataModel
import Foundation

@MainActor
public class RequestDataModel<Model, RequestAdaptor: RequestAdapting, ResponseLoader: ResponseLoading>: AsyncDataModel where Model == RequestAdaptor.ResultResult, ResponseLoader.RequestType == RequestAdaptor.RequestType, ResponseLoader.ResponseType == RequestAdaptor.ResponseType {
    
    @Published
    public private(set) var state: DataModelLoadingState<Model>
    private let params: RequestAdaptor.ParameterType
    private let requestAdaptor: RequestAdaptor
    private let loader: ResponseLoader
    
    public init(params: RequestAdaptor.ParameterType, requestAdaptor: RequestAdaptor, loader: ResponseLoader) {
        self.state = .none
        self.params = params
        self.requestAdaptor = requestAdaptor
        self.loader = loader
    }
    
    public func load() async {
        do {
            switch self.state {
            case let .loaded(model, _):
                self.state = .loaded(model: model, isRefreshing: true)
            default:
                self.state = .loading
            }
            let request = try requestAdaptor.makeRequest(from: params)
            let response = try await loader.loadResponse(for: request)
            let result = try requestAdaptor.parseResponse(response: response)
            self.state = .loaded(model: result, isRefreshing: false)
        } catch {
            self.state = .error(error)
        }
    }
    
    public func refresh() async {
        await self.load()
    }
}
