//
//  ButtonStylesBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 25/07/2023.
//

import SwiftUI

struct ButtonStylesBootCamp: View {
    var body: some View {
        VStack {
            Button {} label: {
                Text("Button Style")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                
                }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .controlSize(.large)
            .padding()
            
        }
    }
}

struct ButtonStylesBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStylesBootCamp()
    }
}
