//
//  SampleData.swift
//  Recipes
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import RecipesCore
import Foundation

extension Recipe {
    @MainActor
    static let sample = Recipe(
        cuisine: "Malaysian",
        name: "Apam Balik",
        largePhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg"),
        smallPhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"),
        uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
        sourceURL: URL(string: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ"),
        youtubeURL: URL(string: "https://www.youtube.com/watch?v=6R8ffRRJcrg")
    )
    
    @MainActor
    static let withoutImage = Recipe(
        cuisine: "Malaysian",
        name: "Apam Balik",
        largePhotoURL: nil,
        smallPhotoURL: nil,
        uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
        sourceURL: URL(string: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ"),
        youtubeURL: URL(string: "https://www.youtube.com/watch?v=6R8ffRRJcrg")
    )
}
