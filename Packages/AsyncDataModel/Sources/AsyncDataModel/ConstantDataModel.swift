//
//  ConstantDataModel.swift
//  AsyncDataModel
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

public class ConstantDataModel<Model>: AsyncDataModel {
    public var state: DataModelLoadingState<Model>
    
    public init(_ value: Model) {
        self.state = .loaded(model: value, isRefreshing: false)
    }
    
    public init(_ error: Error) {
        self.state = .error(error)
    }
    
    public func load() async {
        
    }
    
    public func refresh() async {
        
    }
}
