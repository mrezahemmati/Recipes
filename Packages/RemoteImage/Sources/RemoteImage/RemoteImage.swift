//
//  RemoteImage.swift
//  RemoteImage
//
//  Created by Mohammadreza Hemmati on 1/27/25.
//

import SwiftUI
import ImageLoader

public struct RemoteImage<Content: View>: View {
    @Environment(\.imageLoader) var imageLoader
    @State private var state: AsyncImagePhase = .empty
    
    private let url: URL?
    private let scale: CGFloat
    private let content: @Sendable (AsyncImagePhase) -> Content
    
    public nonisolated init(url: URL?, scale: CGFloat = 1) where Content == _RemoteImageContentView<Image, Color> {
        self.init(url: url, scale: scale) { image in
            image
        } placeholder: {
            Color(UIColor.systemGray6)
        }
    }
    
    public nonisolated init<I, P>(url: URL?, scale: CGFloat = 1, @ViewBuilder content: @escaping @Sendable (Image) -> I, @ViewBuilder placeholder: @escaping @Sendable () -> (P)) where Content == _RemoteImageContentView<I, P>, I: View, P: View {
        self.init(url: url, scale: scale) { phase in
            _RemoteImageContentView(image: phase.image, content: content, placeholder: placeholder)
        }
    }
    
    public nonisolated init(url: URL?, scale: CGFloat = 1, @ViewBuilder content: @escaping @Sendable (AsyncImagePhase) -> Content) {
        self.url = url
        self.scale = scale
        self.content = content
    }
    
    public var body: some View {
        content(state)
            .task {
                state = await loadImage()
            }
    }
    
    private func loadImage() async -> AsyncImagePhase {
        guard let url = url else { return .empty }
        do {
            let image = try await imageLoader.loadImage(url: url, scale: scale)
            return .success(Image(uiImage: image))
        } catch {
            return .failure(error)
        }
    }
}

public struct _RemoteImageContentView<I: View, P: View>: View {
    private let image: Image?
    private let content: @Sendable (Image) -> I
    private let placeholder: @Sendable () -> P
    
    nonisolated fileprivate init(image: Image?, @ViewBuilder content: @escaping @Sendable (Image) -> I, @ViewBuilder placeholder: @escaping @Sendable () -> P) {
        self.image = image
        self.content = content
        self.placeholder = placeholder
    }
    
    public var body: some View {
        if let image = image {
            content(image)
        } else {
            placeholder()
        }
    }
}

extension EnvironmentValues {
    @Entry var imageLoader: ImageLoader = DefaultImageLoader()
}

extension View {
    public func imageLoader(_ imageLoader: ImageLoader) -> some View {
        return environment(\.imageLoader, imageLoader)
    }
}
