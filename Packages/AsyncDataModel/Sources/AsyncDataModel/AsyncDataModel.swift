//
//  AsyncDataModel.swift
//  AsyncDataModel
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import Foundation

public enum DataModelLoadingState<Model> {
    case none
    case loading
    case loaded(model: Model, isRefreshing: Bool)
    case error(Error)
}

@MainActor
public protocol AsyncDataModel: ObservableObject {
    associatedtype Model
    
    var state: DataModelLoadingState<Model> { get }
    
    func load() async
    func refresh() async
}
