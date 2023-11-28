//
//  PhotoModelFileManager.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 27/11/2023.
//

import Foundation
import SwiftUI

class PhotoModelFileManager {
    static let instance = PhotoModelFileManager()
    let fileManagerFolderName = "downloaded_photo"
    private init() {
    }
    
    private func createFileManagerFolderIfNeeded() {
        guard let url = getFileManagerFolderPath() else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
                print("created folder")
            } catch let error {
                print("error creating folder \(error)")
            }
        }
    }
    
    private func getFileManagerFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(fileManagerFolderName)
    }
    
    private func getImagePath(key: String) -> URL? {
        guard let folderPath = getFileManagerFolderPath() else {
            return nil
        }
        
        return folderPath.appendingPathComponent(key + ".png")
    }
    
    func addToFileManager(key: String, value: UIImage) {
        guard
            let data = value.pngData(),
            let url = getImagePath(key: key) else { return }
        
        do {
            
            try data.write(to: url)
            
        } catch let error {
            print("error saving to file manager. \(error)")
        }
    }
    
    func getImageFromFileManager(key: String) -> UIImage? {
        guard let url = getImagePath(key: key),
              FileManager.default.fileExists(atPath: url.path)
        else {
            return nil
        }
        
        return UIImage(contentsOfFile: url.path)
    }
    
}
