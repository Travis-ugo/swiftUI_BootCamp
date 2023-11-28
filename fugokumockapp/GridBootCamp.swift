//
//  GridBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 18/07/2023.
//
// Dear lorrrddd. Swift is awesome.
// I learned how to create different kinds of grids in swiftUI, a very
// stressfull task to perform in Flutter using slivers and SliverGridView in
// flutter, thank God For a new light
import SwiftUI

struct GridBootCamp: View {
    let coloumn : [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.purple)
                .frame(height: 350)
            
            LazyVGrid(
                columns: coloumn,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders],
                content: {
                    Section(
                        header: Text("Section 1")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(),
                        
                        footer: Text("End Section 1")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(),
                        
                        content: {
                        ForEach(0..<20) { index in
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.blue)
                                .frame(height: 150)
                            }
                    })
                    
                    Section(
                        header: Text("Section 2")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(),
                        
                        footer: Text("End Section 2")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(),
                        
                        content: {
                        ForEach(0..<10) { index in
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.orange)
                                .frame(height: 150)
                            }
                    })
            })
//            LazyVGrid (columns: coloumn) {
//                ForEach(0..<40) {index in
//                    RoundedRectangle(cornerRadius: 5)
//                        .fill(Color.blue)
//                        .frame(height: 150)
//                }
//            }
//            .padding(.all, 5)
        }
        
    }
}

struct GridBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GridBootCamp()
    }
}
