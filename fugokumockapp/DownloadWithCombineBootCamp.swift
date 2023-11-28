//
//  DownloadWithCombineBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 07/09/2023.
//

import SwiftUI
import Combine

struct PostModelCombine: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownLoadWithCombineViewModel: ObservableObject {
    @Published var posts: [PostModelCombine] = []
    var cancellable = Set<AnyCancellable>()
    
    init() {
        getPost()
    }
    
    func getPost() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap (handleOutPut)
            .decode(type: [PostModelCombine].self , decoder: JSONDecoder())
        
            .sink { (completion) in
                
                print("COMPLETION: \(completion)")
                
            } receiveValue: { [weak self] (returnedPosts) in
                
                self?.posts = returnedPosts
                
            }
        
            .store(in: &cancellable)
        
        func handleOutPut(output: URLSession.DataTaskPublisher.Output) throws -> Data {
            guard let response = output.response as? HTTPURLResponse,
                  response.statusCode >= 200 &&  response.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
            return output.data
        }
    }
}

struct DownloadWithCombineBootCamp: View {
    
    @StateObject var vm = DownLoadWithCombineViewModel()
    
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

struct DownloadWithCombineBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithCombineBootCamp()
    }
}
