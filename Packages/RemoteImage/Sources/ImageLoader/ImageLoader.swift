//
//  ImageLoader.swift
//  RemoteImage
//
//  Created by Mohammadreza Hemmati on 1/27/25.
//

import Foundation
import UIKit
import SwiftUI

public enum ImageLoaderError: Error {
    case couldNotLoadData(_ underlyingError: Error?)
    case couldNotConvertDataToImage
}

public protocol ImageLoader: Sendable {
    func loadImage(url: URL, scale: CGFloat) async throws -> UIImage
}

extension EnvironmentValues {
    @Entry var imageLoader: ImageLoader = DefaultImageLoader()
}

extension View {
    public func imageLoader(_ imageLoader: ImageLoader) -> some View {
        return environment(\.imageLoader, imageLoader)
    }
}
