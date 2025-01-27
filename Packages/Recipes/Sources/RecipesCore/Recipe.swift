//
//  Recipe.swift
//  Recipes
//
//  Created by Mohammadreza Hemmati on 1/26/25.
//

import Foundation

public struct Recipe {
    public let cuisine: String
    public let name: String
    public let largePhotoURL: URL?
    public let smallPhotoURL: URL?
    public let uuid: String
    public let sourceURL: URL?
    public let youtubeURL: URL?
    
    public init(cuisine: String, name: String, largePhotoURL: URL?, smallPhotoURL: URL?, uuid: String, sourceURL: URL?, youtubeURL: URL?) {
        self.cuisine = cuisine
        self.name = name
        self.largePhotoURL = largePhotoURL
        self.smallPhotoURL = smallPhotoURL
        self.uuid = uuid
        self.sourceURL = sourceURL
        self.youtubeURL = youtubeURL
    }
}

extension Recipe: Codable {
    enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case largePhotoURL = "photo_url_large"
        case smallPhotoURL = "photo_url_small"
        case uuid
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
}

extension Recipe: Identifiable {
    public var id: String {
        return uuid
    }
}

extension Recipe: Sendable {}
