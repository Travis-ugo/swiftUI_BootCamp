//
//  DownloadingWithEscapingBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 10/08/2023.
//

import SwiftUI


struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}



class DownLoadWithExcapingViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPost()
    }
    
    func getPost() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        downloadData(fromURL: url) { (returnedData) in
            if let data = returnedData {
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                }
            } else {
                print("NO DATA RETURNED")
            }
        }
    }
    
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                print("ERROR OCCURED \(String(describing: error))")
                completionHandler(nil)
                return
            }
            completionHandler(data)
        }.resume()
    }
    
}

struct DownloadingWithEscapingBootCamp: View {
    
    @StateObject var vm = DownLoadWithExcapingViewModel()
    
    var body: some View {
        List {
            Text("PURCHAse")
            ForEach (vm.posts) { post in
                VStack(alignment: .leading ,spacing: 10) {
                    Text("USER ID:: \(post.userId)")
                    Text("ID :: \(post.id)")
                    Text(post.title)
                    Text(post.body)
                }
            }
        }
    }
}

struct DownloadingWithEscapingBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingWithEscapingBootCamp()
    }
}
