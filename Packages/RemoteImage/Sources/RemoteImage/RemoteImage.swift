//
//  RemoteImage.swift
//  RemoteImage
//
//  Created by Mohammadreza Hemmati on 1/27/25.
//

import SwiftUI

struct RemoteImage: View {
    var url: URL
    
    var body: some View {
        Image(systemName: "photo")
    }
}

#Preview {
    RemoteImage(url: URL(string: "https://example.com/image.jpg")!)
}
