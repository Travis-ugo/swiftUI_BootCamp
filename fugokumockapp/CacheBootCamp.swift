//
//  CacheBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 21/11/2023.
//

import SwiftUI

class CacheManager {
    
    static let instance = CacheManager()
    
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }()
    
    func addImageToCache(image: UIImage, name: String) -> String {
        imageCache.setObject(image, forKey: name as NSString)
        return "added Image to cache"
    }

    func removeImageFromCache(name: String) -> String {
        imageCache.removeObject(forKey: name as NSString)
        return "removed from cache"
    }
    
    func getImageFromCache(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
}

class CacheViewModel: ObservableObject {
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    @Published var infoMessage: String = ""
    
    let cacheManager = CacheManager.instance
    let imageName: String = "lamar"
    
    init() {
        getImageFromAsset()
    }
    
    func getImageFromAsset() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = startingImage else { return }
        infoMessage = cacheManager.addImageToCache(image: image, name: imageName)
    }
    
    func removeFromCache() {
        infoMessage = cacheManager.removeImageFromCache(name: imageName)
    }
    
    func getFromCache() {
        if let returnedImage = cacheManager.getImageFromCache(name: imageName) {
            cachedImage = returnedImage
            infoMessage = "Got Image from cache"
        } else {
            infoMessage = "Image not found in cache"
        }
    }
}

struct CacheBootCamp: View {
    @StateObject var vm = CacheViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                if let image = vm.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .clipped()
                        .cornerRadius(20)
                }
                
                HStack {
                    
                    Button(
                        action: {
                            vm.saveToCache()
                        }, label: {
                            Text("Save to Cache")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                    })
                    
                    Button(
                        action: {
                            vm.removeFromCache()
                        }, label: {
                            Text("Delete from Cache")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                    })
                    
                } .padding(.vertical, 20)
                
                Button(
                    action: {
                        vm.getFromCache()
                    }, label: {
                        Text("Get from Cache")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                })
                .padding(.bottom, 20)
                
                if let image = vm.cachedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(20)
                }
                
                Text(vm.infoMessage)
                    .font(.headline)
                
                Spacer()
                
            } .navigationTitle("Cache Sauce")
        }
    }
}

struct CacheBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        CacheBootCamp()
    }
}
