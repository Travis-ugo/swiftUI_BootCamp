//
//  AnimationsBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 19/07/2023.
//

import SwiftUI

struct AnimationsBootCamp: View {
    @State var isAnimated : Bool = false
    
    var body: some View {
        VStack{
            Button("Button Plus") {
                withAnimation(
                    Animation
                        .default
                        .repeatCount(11),
//                        .delay(0.6),
                    {
                    isAnimated.toggle()
                })
               
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 100 : 25)
                .fill(isAnimated ? Color.red : Color.green)
                .frame(width:isAnimated ? 90 : 150, height:isAnimated ? 90 : 150)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
//                .animation(Animation
//                    .default
//                    .repeatCount(11))
            Spacer()
        }
        
    }
}

struct AnimationsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsBootCamp()
    }
}
