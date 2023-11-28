//
//  MaskBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 02/08/2023.
//

import SwiftUI

struct MaskBootCamp: View {
    
    @State var rating = 0
    
    var body: some View {
        ZStack {
            startsView
                .overlay(overlay.mask(startsView))
        }
    }
    
    private var overlay: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var startsView: some View{
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture(perform: {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    })
            }
        }
    }
    
}

struct MaskBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootCamp()
    }
}
