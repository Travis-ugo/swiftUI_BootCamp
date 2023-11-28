//
//  PhotoModel.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 22/11/2023.
//

import Foundation



struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
