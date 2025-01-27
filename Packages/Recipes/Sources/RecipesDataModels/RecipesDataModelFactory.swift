//
//  RecipesDataModelFactory.swift
//  Recipes
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import Foundation
import RequestDataModel
import HTTPRequest
import BundleResourceRequest
import RecipesCore

@MainActor
public class RecipesDataModelFactory {
    public static func dataModel(url: URL, session: URLSession = .shared) -> RecipesDataModel {
        return .init(RequestDataModel(
            params: url,
            requestAdaptor: HTTPRequest<RecipeList>(),
            loader: session
        ))
    }
    
    public static func dataModel(bundle: Bundle, resource: String, fileExtension: String = "json") -> RecipesDataModel {
        return .init(RequestDataModel(
            params: BundleResource(bundle: bundle, resourceName: resource, fileExtension: fileExtension),
            requestAdaptor: BundleResourceRequest<RecipeList>(),
            loader: BundleResourceLoader()
        ))
    }
}
