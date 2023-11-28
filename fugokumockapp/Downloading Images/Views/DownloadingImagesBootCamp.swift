//
//  DownloadingImagesBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 22/11/2023.
//

import SwiftUI

struct DownloadingImagesBootCamp: View {
    @StateObject var vm = DownloadPhotoViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images")
        }
    }
}

struct DownloadingImagesBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesBootCamp()
    }
}
