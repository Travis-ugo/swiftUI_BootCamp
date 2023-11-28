//
//  SafeAreaBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 18/07/2023.
//

import SwiftUI

struct SafeAreaBootCamp: View {
    var body: some View {
//        ZStack {
//            Color.orange
//                .ignoresSafeArea()  // second way to ignore safe area
        
        
            ScrollView () {
                
            LazyVStack(
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders]
            ) {
                    Section(
                        
                        header: Text("SafeArea widget in Swift")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .leading),
                        content: {
                            ForEach(0..<8) { index in
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                                    .frame(width: 150, height: 100, alignment: .leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 20)
                                    .padding(.top, 10)
                            }
                        }
                    )
                }
            }
            
            .background(
                Color.purple.ignoresSafeArea(edges: .top)
        )
//        }
    }
}

struct SafeAreaBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaBootCamp()
    }
}
