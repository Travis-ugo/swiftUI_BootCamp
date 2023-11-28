//
//  PaddingBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 14/07/2023.
//

import SwiftUI

struct PaddingBootCamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                
            Text("The land is greener on the other side of town, the secret to success is in the heart of reading men who are ready to learn")
              
        }
        .padding()
        .padding(.vertical, 10)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 10,
                    x: 0.0, y: 10
                )
        )
        .padding(.all, 10)
    }
}

struct PaddingBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        PaddingBootCamp()
    }
}
