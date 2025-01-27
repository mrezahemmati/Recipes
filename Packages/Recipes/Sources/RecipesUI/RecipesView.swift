//
//  RecipesView.swift
//  Recipes
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import SwiftUI
import RecipesCore
import RecipesDataModels
import AsyncDataModel

public struct RecipesView: View {
    @ObservedObject var dataModel: RecipesDataModel
    
    public init(dataModel: RecipesDataModel) {
        self.dataModel = dataModel
    }
    
    public var body: some View {
        Group {
            switch dataModel.state {
            case .none:
                Color.clear
            case .loading:
                ProgressView()
            case let .loaded(model, _):
                List(model.recipes) { recipe in
                    RecipeView(recipe: recipe)
                }
                .listStyle(.plain)
                .overlay {
                    if model.recipes.isEmpty {
                        contentUnavailableView(
                            title: "No recepies found",
                            systemImage: "rectangle.on.rectangle.slash"
                        )
                    }
                }
                .refreshable {
                    await dataModel.refresh()
                }
            case let .error(error):
                contentUnavailableView(
                    title: "Something went wrong, please try again later.",
                    systemImage: "exclamationmark.triangle"
                )
                .task {
                    print(error)
                }
            }
        }
        .task {
            await dataModel.load()
        }
    }
    
    @ViewBuilder
    func contentUnavailableView(title: String, systemImage: String) -> some View {
        if #available(iOS 17.0, *) {
            ContentUnavailableView(title, systemImage: systemImage)
        } else {
            Label(title, systemImage: systemImage)
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

#Preview("Loading") {
    RecipesView(
        dataModel: .init(ConstantDataModel<RecipeList>(state: .loading))
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
