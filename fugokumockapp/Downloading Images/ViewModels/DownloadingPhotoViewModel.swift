//
//  DownloadingPhotoViewModel.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 22/11/2023.
//

import Foundation
import Combine


class DownloadPhotoViewModel: ObservableObject {
    @Published var dataArray: [PhotoModel] = []
    
    var cancellable = Set<AnyCancellable>()
    
    let dataService = PhotoModelDataService.instance
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photoModels
            .sink {[weak self] (returnedPhotoModels) in
                self?.dataArray = returnedPhotoModels
            }
            .store(in: &cancellable)
    }
}
