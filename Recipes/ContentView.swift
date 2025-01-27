//
//  ContentView.swift
//  Recipes
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import SwiftUI
import RecipesUI
import RecipesDataModels

struct ContentView: View {
    @StateObject
    private var dataModel = RecipesDataModelFactory.dataModel(
        url: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
    )
    
    var body: some View {
        NavigationView {
            RecipesView(dataModel: dataModel)
                .navigationTitle("Recipes")
        }
    }
}

#Preview {
    ContentView()
}
