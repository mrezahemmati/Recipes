//
//  ConstantDataModel.swift
//  AsyncDataModel
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

public class ConstantDataModel<Model>: AsyncDataModel {
    public private(set) var state: DataModelLoadingState<Model>
    
    public convenience init(_ value: Model) {
        self.init(state: .loaded(model: value, isRefreshing: false))
    }
    
    public convenience init(_ error: Error) {
        self.init(state: .error(error))
    }
    
    public init(state: DataModelLoadingState<Model>) {
        self.state = state
    }
    
    public func load() async {
        
    }
    
    public func refresh() async {
        
    }
}
