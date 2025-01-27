//
//  RecipeList.swift
//  Recipes
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

public struct RecipeList {
    public let recipes: [Recipe]
    
    public init(recipes: [Recipe]) {
        self.recipes = recipes
    }
}

extension RecipeList: Codable {}
