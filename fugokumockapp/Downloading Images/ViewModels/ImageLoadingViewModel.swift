//
//  ImageLoadingViewModel.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 22/11/2023.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
    
    let urlString: String
    let imageKey: String
    
    var cancellables = Set<AnyCancellable>()
//    let manager = PhotoModelCacheManager.instance
    let manager = PhotoModelFileManager.instance
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        getImage()
    }
    func getImage() {
//        if let savedImage = manager.getImageFromCache(key: imageKey) {
        if let savedImage = manager.getImageFromFileManager (key: imageKey) {
            image = savedImage
            print("Getting saved Image")
        } else {
            downloadImage()
            print("downloading Image")
        }
    }
    
    func downloadImage() {
        print("downloading Image")
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map {UIImage(data: $0.data)}
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                guard let self = self,
                      let image = returnedImage else { return }
                self.image = returnedImage
//                self.manager.addToCache(key: self.imageKey, value: image)
                self.manager.addToFileManager(key: self.imageKey, value: image)
            }
            .store(in: &cancellables)
    }
}
