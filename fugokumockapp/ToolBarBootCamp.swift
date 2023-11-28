//
//  ToolBarBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 26/07/2023.
//

import SwiftUI

struct ToolBarBootCamp: View {
    @State private var text: String = ""
    @State private var path: [String] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                Text("Hey 😎")
                    .foregroundColor(Color.white)
                
                ScrollView {
                    TextField("Place Holder",text: $text)
                        .padding()
                        .background(Color.gray.brightness(0.2))
                        .cornerRadius(10)
                        .padding()
                    
                    ForEach(0..<10) { _ in
                        Rectangle()
                            .fill(Color.purple)
                            .frame(width: 200, height: 200)
                    }
                }
            }
             
            .navigationTitle("Tool Bar")
//            .toolbar(.automatic,for: .navigationBar)
//            .toolbarBackground(.hidden, for: .navigationBar)
//            .toolbarColorScheme(.dark, for: .navigationBar)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Image(systemName: "heart.fill")
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "gear")
                }
            }
            
            .toolbarTitleMenu{
                Button("Screen 1") {
                    path.append("Screen 1")
                }
                Button("Screen 2") {
                    path.append("Screen 2")
                }
            }
            
            .navigationDestination(for: String.self) { value in
                Text("New Screen: \(value)")
            }
        }
    }
}

struct ToolBarBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarBootCamp()
    }
}
