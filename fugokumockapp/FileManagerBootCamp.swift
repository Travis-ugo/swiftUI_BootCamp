//
//  FileManagerBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 21/11/2023.
//

import SwiftUI

class LocalFIleManager {
    static let instance = LocalFIleManager()
    let directoryFolderName = "MyApp_Images"
    
    init() {
        createNewDirectoryFolderIfNeeded()
    }
    
    func createNewDirectoryFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(directoryFolderName)
                .path else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager
                    .default
                    .createDirectory(atPath: path,
                                     withIntermediateDirectories: true,
                                     attributes: nil)
                print("successfully created folder directory")
            } catch let error {
                print("Error creating folder directory \(error)")
            }
        }
    }
    
    func deleteDirectoryFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(directoryFolderName)
                .path else {
            return
        }
        
        do {
            try FileManager
                .default
                .removeItem(atPath: path)
            print("successfully deleted folder directory")
        } catch let error {
            print("Error deleting folder directory \(error)")
        }
    }
    
    func saveImageToFileManager(image: UIImage, name: String) -> String {
        
        guard let data = image.jpegData(compressionQuality: 1.0),
        let path = getPathForImage(name: name) else {
            return "Error Getting Data"
        }

        do {
            try data.write(to: path)
            print(path)
            return"SAVEDATA SUCCESSFUL"
        } catch let error {
            return "SAVEDATA FAILURE \(error)"
        }
        
    }
    
    func getImageFromFileManager(name: String) -> UIImage? {
        
        guard let path = getPathForImage(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else {
            print("ERROR GETTING PATH")
            return nil
        }

        return UIImage(contentsOfFile: path)
    }
    
    func deleteImageFromFileManager(name: String) -> String {
      
        guard let path = getPathForImage(name: name)?.path,
              FileManager.default.fileExists(atPath: path) else {
            return"ERROR GETTING PATH"
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            return "SUCCESSFULLY DELETED"
        } catch let error {
            return "ERROR OCCURED \(error)"
        }
    }
    
    func getPathForImage(name: String) -> URL? {
        guard let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(directoryFolderName)
            .appendingPathComponent("\(name).jpeg") else {
            print("ERROR GETTING PATH")
            return nil
        }
        return path
    }
}

class FileManegerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var infoMessage: String = ""
    
    let manager = LocalFIleManager.instance
    let imageName: String = "lamar"
    
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image =  manager.getImageFromFileManager(name: imageName)
    }
    
    func deleteImageFromFileManager() {
        infoMessage = manager.deleteImageFromFileManager(name: imageName)
        
        manager.deleteDirectoryFolderIfNeeded()
    }
    
    func saveImageToFileManager() {
        guard let image = image else { return }
        infoMessage = manager.saveImageToFileManager(image: image, name: imageName)
    }
}

struct FileManagerBootCamp: View {
    @StateObject var vm = FileManegerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .clipped()
                        .cornerRadius(10)
                }
                
                HStack {
                    Button(
                        action: {vm.saveImageToFileManager()},
                        label: {
                        Text("Save to FM")
                                .foregroundColor(Color.white)
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        })
               
                    Button(
                        action: {vm.deleteImageFromFileManager()},
                        label: {
                        Text("Delete from FM")
                                .foregroundColor(Color.white)
                                .font(.headline)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        })
             
                }
                .padding(.vertical, 30)
                
                Text(vm.infoMessage)
                    .font(.headline)
                    .foregroundColor(Color.purple)
                
                Spacer()
            }.navigationTitle("Love")
        }
    }
}

struct FileManagerBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerBootCamp()
    }
}
