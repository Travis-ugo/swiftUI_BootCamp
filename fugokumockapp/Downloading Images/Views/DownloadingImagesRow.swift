//
//  DownloadingImagesRow.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 22/11/2023.
//

import SwiftUI

struct DownloadingImagesRow: View {
    let model: PhotoModel
    var body: some View {
        HStack {
            DownloadingImageView(url: model.url, key: "\(model.id)")
                .frame(width: 60, height: 60)
            VStack (alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct DownloadingImagesRow_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesRow(model: PhotoModel(albumId: 1, id: 1, title: "Fake model", url: "https://via.placeholder.com/600/24f355", thumbnailUrl: "https://via.placeholder.com/600/24f355"))
            .previewLayout(.sizeThatFits)
    }
}
