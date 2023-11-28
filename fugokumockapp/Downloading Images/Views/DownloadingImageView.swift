//
//  DownloadingImageView.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 22/11/2023.
//

import SwiftUI

struct DownloadingImageView: View {
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String, key: String) {
        _loader = StateObject(
            wrappedValue: ImageLoadingViewModel(url: url, key: key)
        )
    }
    
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            }
            else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

struct DownloadingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImageView(url: "https://via.placeholder.com/600/771796", key: "fake_key")
            .previewLayout(.sizeThatFits)
    }
}
