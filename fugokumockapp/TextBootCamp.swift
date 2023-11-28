//
//  TextBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 07/07/2023.
//

import SwiftUI

struct TextBootCamp: View {
    var body: some View {
        VStack{
            Text("Hello world!!".capitalized)
             
                .font(.headline)
                .fontWeight(.semibold)
    //            .strikethrough(true, color: Color.red)
                .multilineTextAlignment(.leading)
                .frame(width: 200, height: 100)
                .minimumScaleFactor(0.1)
            
            Circle()
                .fill(
                    .linearGradient(colors: [Color.pink, Color.orange], startPoint: .leading, endPoint: .topTrailing))
//                .fill(Color("CustomColor"))
                .shadow(color: Color.red,radius: 10, x:-10, y: 10)
        }
    }
}

struct TextBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootCamp()
    }
}

