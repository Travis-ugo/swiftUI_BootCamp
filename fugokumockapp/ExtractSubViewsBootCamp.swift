//
//  ExtractSubViewsBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 19/07/2023.
//

import SwiftUI

struct ExtractSubViewsBootCamp: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                MyFirstExtractedSubView(title: "Black Berry", subTible: "Floating Berries", color: Color.white)
                
                MyFirstExtractedSubView(title: "Yellow Berry", subTible: "Groseries", color: Color.yellow)
            }
        }
    }
}

struct ExtractSubViewsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubViewsBootCamp()
    }
}

struct MyFirstExtractedSubView: View {
    
    let title : String
    let subTible : String
    let color: Color
    
    var body: some View {
        VStack (alignment: .center) {
            Text(title)
                .fontWeight(.bold)
            Text(subTible)
                .fontWeight(.bold)
        }
        .padding()
        .background(color)
        .cornerRadius(15)
    }
}
