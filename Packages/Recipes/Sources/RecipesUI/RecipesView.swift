//
//  RecipesView.swift
//  Recipes
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import SwiftUI
import RecipesCore
import RecipesDataModels

public struct RecipesView: View {
    @ObservedObject var dataModel: RecipesDataModel
    
    public init(dataModel: RecipesDataModel) {
        self.dataModel = dataModel
    }
    
    public var body: some View {
        Group {
            switch dataModel.state {
            case .none:
                Text("none")
            case .loading:
                Text("loading")
            case .loaded:
                Text("loaded")
            case .error:
                Text("error")
            }
        }
        .task {
            await dataModel.load()
        }
    }
}

#Preview("Loaded") {
    RecipesView(
        dataModel: RecipesDataModelFactory.dataModel(
            bundle: .module,
            resource: "recipes"
        )
    )
}

#Preview("Empty") {
    RecipesView(
        dataModel: RecipesDataModelFactory.dataModel(
            bundle: .module,
            resource: "recipes-empty"
        )
    )
}

#Preview("Malformed") {
    RecipesView(
        dataModel: RecipesDataModelFactory.dataModel(
            bundle: .module,
            resource: "recipes-malformed"
        )
    )
}
