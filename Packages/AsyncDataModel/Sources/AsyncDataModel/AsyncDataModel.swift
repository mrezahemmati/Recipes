//
//  AsyncDataModel.swift
//  AsyncDataModel
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import Foundation

public enum DataModelLoadingPhase<Model> {
    case none
    case loading
    case loaded(Model)
    case failed(Error)
}

@MainActor
public protocol AsyncDataModel: ObservableObject {
    associatedtype Model
    
    var phase: DataModelLoadingPhase<Model> { get }
    
    func load()
    func refresh()
}
