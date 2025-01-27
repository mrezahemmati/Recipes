//
//  RecipesView.swift
//  Recipes
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import SwiftUI
import RecipesCore
import RecipesDataModels

struct RecipesView: View {
    @ObservedObject var dataModel: RecipesDataModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RecipesView(dataModel: .constant(RecipeList(recipes: [])))
}
