//
//  RecipesApp.swift
//  Recipes
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import SwiftUI
import CachingImageLoader
import LocalDiskCache
import ImageLoader

@main
struct RecipesApp: App {
    let cache = LocalDiskCache()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .imageLoader(CachingImageLoader(cache: cache))
        }
    }
}
