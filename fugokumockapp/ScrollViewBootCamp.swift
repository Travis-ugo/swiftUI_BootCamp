//
//  ScrollViewBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 18/07/2023.
//

import SwiftUI
// use  LazyVStack for preloaded items, or thing to be
// loaded in future, when the UI view needs to show it's content
struct ScrollViewBootCamp: View {
    var body: some View {
    
        ScrollView {
            LazyVStack {
                ForEach(0..<15) { index in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(0..<15) { index in
                                RoundedRectangle(cornerRadius: 20.0)
                                    .fill(Color.purple)
                                    .frame(width: 200, height: 130)
                                    .padding(.all, 5)
                                }
                            }
                        }
                        )
                    }
                }
            }
        }
    }


struct ScrollViewBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBootCamp()
    }
}
