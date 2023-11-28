//
//  ContextMenuBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 20/07/2023.
//

import SwiftUI

struct ContextMenuBootCamp: View {
    
    @State var backGroundColor = Color.blue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("SwiftUI Tutorial")
                .font(.headline)
                .fontWeight(.heavy)
            Text("A Beautiful glamarous experience")
                .fontWeight(.medium)
            
        }
        .foregroundColor(Color.white)
        .padding(20)
        .background(backGroundColor)
        .cornerRadius(30)
        .contextMenu{
            Button(action: {
                backGroundColor = .red
            }, label: {
                Label("Share post", systemImage: "flame.fill")
            })
            
            Button(action: {
                backGroundColor = .yellow
            }, label: {
                Text("Report Post")
            })
            
            Button(action: {
                backGroundColor = .purple
            }, label: {
                HStack {
                 Text("Like Post")
                Image(systemName: "heart.fill")
                }
            })

        }
    }
}

struct ContextMenuBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBootCamp()
    }
}
