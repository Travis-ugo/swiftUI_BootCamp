//
//  AsyncImageBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 25/07/2023. 
//

import SwiftUI

struct AsyncImageBootCamp: View {
    
    let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)

            case .failure:
                Image(systemName: "questionmark")
                    .font(.largeTitle)
                
           default:
                Image(systemName: "questionmark")
                    .font(.largeTitle)
            }
            
        }
//        AsyncImage(
//            url: url,
//            content: { returnedImage in
//                returnedImage
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 100, height: 100)
//                    .cornerRadius(15)
//            },
//            placeholder: {
//            ProgressView()
//        })
    }
}

struct AsyncImageBootCamp_Previews: PreviewProvider {
    static var previews: some View {        AsyncImageBootCamp()
    }
}
