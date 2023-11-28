//
//  RotationGestureBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 31/07/2023.
//

import SwiftUI

struct RotationGestureBootCamp: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color.white)
            .frame(width: 200, height: 100)
            .background(Color.purple)
            .cornerRadius(10)
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle =  Angle(degrees: 0)
                        }
                    }
            )
    }
}

struct RotationGestureBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureBootCamp()
    }
}
