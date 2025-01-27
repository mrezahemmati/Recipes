import Testing
import Foundation
@testable import RecipesCore

struct RecipeTests {
    func readRecipe(for resource: String) throws -> Recipe {
        let url = try #require(Bundle.module.url(forResource: resource, withExtension: "json"))
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(Recipe.self, from: data)
    }
    
    @Test()
    func decodeAllFields() async throws {
        let recipe = try readRecipe(for: "all-fields-recipe")
        #expect(recipe.largePhotoURL != nil)
        #expect(recipe.smallPhotoURL != nil)
        #expect(recipe.sourceURL != nil)
        #expect(recipe.youtubeURL != nil)
    }
    
    @Test()
    func decodeRequiredOnlyFields() async throws {
        let recipe = try readRecipe(for: "required-only-fields-recipe")
        #expect(recipe.largePhotoURL == nil)
        #expect(recipe.smallPhotoURL == nil)
        #expect(recipe.sourceURL == nil)
        #expect(recipe.youtubeURL == nil)
    }
    
    @Test(arguments: [
        "empty-recipe",
        "invalid-uuid-type-recipe"
    ])
    func decodeInvalid(resource: String) async throws {
        #expect(throws: Error.self, performing: {
            try readRecipe(for: resource)
        })
    }
}
