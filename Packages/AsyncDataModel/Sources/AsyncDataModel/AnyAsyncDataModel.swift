//
//  AnyAsyncDataModel.swift
//  AsyncDataModel
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import Foundation
import Combine

@MainActor
public final class AnyAsyncDataModel<Model>: AsyncDataModel {
    private let base: any AsyncDataModel
    private let _state: () -> DataModelLoadingState<Model>
    private var cancellables = Set<AnyCancellable>()
    
    public var state: DataModelLoadingState<Model> {
        return _state()
    }
    
    public init<T: AsyncDataModel>(_ dataModel: T) where T.Model == Model {
        self._state = { dataModel.state }
        self.base = dataModel
        
        dataModel.objectWillChange
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
    
    public func load() async {
        await base.load()
    }
    
    public func refresh() async {
        await base.refresh()
    }
}

extension AnyAsyncDataModel {
    public static func constant(_ value: Model) -> AnyAsyncDataModel<Model> {
        return .init(ConstantDataModel(value))
    }
}
