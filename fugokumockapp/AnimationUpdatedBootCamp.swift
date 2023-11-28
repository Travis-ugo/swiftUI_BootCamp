//
//  AnimationUpdatedBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 26/07/2023.
//
// episode 67
import SwiftUI

struct AnimationUpdatedBootCamp: View {
    
    @State var alignmentAni: Bool = false
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Button("Button 1") {
                    alignmentAni.toggle()

//                    withAnimation(.spring()) {
//                        alignmentAni.toggle()
//                    }
                }
                .foregroundColor(Color.white)
                
                Button("Button 2") {}
                    .foregroundColor(Color.white)
                

                Rectangle()
                    .frame(width: 100,height: 100)
                    .frame(maxWidth: .infinity, alignment:  alignmentAni ? .leading : .trailing)
                    .background()
                

            }
        }
        .animation(.spring(), value: alignmentAni)
//        . animation(.spring())  old way of doing it
        
    }
}

struct AnimationUpdatedBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationUpdatedBootCamp()
    }
}
