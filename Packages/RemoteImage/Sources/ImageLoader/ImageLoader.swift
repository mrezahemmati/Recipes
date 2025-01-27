//
//  ImageLoader.swift
//  RemoteImage
//
//  Created by Mohammadreza Hemmati on 1/27/25.
//

import Foundation
import UIKit

public enum ImageLoaderError: Error {
    case couldNotLoadData(_ underlyingError: Error?)
    case couldNotConvertDataToImage
}

public protocol ImageLoader: Sendable {
    func loadImage(url: URL, scale: CGFloat) async throws -> UIImage
}
