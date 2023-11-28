//
//  AnimationTimingBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 19/07/2023.
//
// DEPRICATED: 
import SwiftUI

@available(iOS, introduced: 13.0, deprecated: 15.0, message: "Use withAnimation or animation(_:value:) instead.")
struct AnimationTimingBootCamp: View {
    @State var isAnimating : Bool = false
    let timing : Double = 3
    
    var body: some View {
        VStack {
            Button("Button Doesn't really matter"){
                isAnimating.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.yellow)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.linear(duration: timing))
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeIn(duration: timing))
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeInOut(duration: timing))
             
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.purple)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeOut(duration: timing))
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.spring(
                    response: 0.5,
                    dampingFraction: 0.3,
                    blendDuration: 1.0
                )
            )
        }
    }
}

struct AnimationTimingBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTimingBootCamp()
    }
}
