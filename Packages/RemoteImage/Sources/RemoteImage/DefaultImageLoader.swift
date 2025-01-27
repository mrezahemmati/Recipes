//
//  DefaultImageLoader.swift
//  RemoteImage
//
//  Created by Mohammadreza Hemmati on 1/27/25.
//

import Foundation
import ImageLoader
import UIKit

final class DefaultImageLoader: ImageLoader {
    let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func loadImage(url: URL, scale: CGFloat) async throws -> UIImage {
        let data = try await loadData(url: url)
        guard let image = UIImage(data: data, scale: scale) else {
            throw ImageLoaderError.couldNotConvertDataToImage
        }
        return image
    }
    
    private func loadData(url: URL) async throws -> Data {
        do {
            return try await urlSession.data(from: url).0
        } catch {
            throw ImageLoaderError.couldNotLoadData(error)
        }
    }
}
