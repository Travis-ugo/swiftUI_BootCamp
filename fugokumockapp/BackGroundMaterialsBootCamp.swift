//
//  BackGroundMaterialsBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 25/07/2023.
//

import SwiftUI

struct BackGroundMaterialsBootCamp: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
               RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 4)
                    .padding()
                
                Spacer()
            }
                .frame(height: 350)
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
                .cornerRadius(20)
        }
        .background(
            Image("lamar")
                .resizable()
                .scaledToFill()
//                .ignoresSafeArea()
        )
        .ignoresSafeArea()
    }
}

struct BackGroundMaterialsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        BackGroundMaterialsBootCamp()
    }
}
