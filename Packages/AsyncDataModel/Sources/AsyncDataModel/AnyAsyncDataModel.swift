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
    private let _load: () async -> Void
    private let _refresh: () async -> Void
    private var cancellables = Set<AnyCancellable>()
    
    @Published
    public private(set) var state: DataModelLoadingState<Model>
    
    public init<T: AsyncDataModel>(_ dataModel: T) where T.Model == Model {
        self.state = dataModel.state
        
        self._load = { await dataModel.load() }
        self._refresh = { await dataModel.refresh() }
        
        dataModel.objectWillChange
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.state = dataModel.state
            }
            .store(in: &cancellables)
    }
    
    public func load() async {
        await _load()
    }
    
    public func refresh() async {
        await _refresh()
    }
}
