//
//  RecipeView.swift
//  Recipes
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import SwiftUI
import RecipesCore

struct RecipeView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack {
            AsyncImage(url: recipe.smallPhotoURL) { image in
                image.resizable()
            } placeholder: {
                if recipe.smallPhotoURL != nil {
                    Color(.lightGray)
                } else {
                    Image(systemName: "photo")
                        .font(.title)
                        .foregroundStyle(.secondary)
                }
            }
            .frame(width: 80, height: 80)
            .clipShape(.rect(cornerRadius: 8))
            .shadow(radius: 4)
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .bold()
                Text(recipe.cuisine)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview("Regular") {
    RecipeView(recipe: .sample)
}

#Preview("No Image") {
    RecipeView(recipe: .withoutImage)
}
