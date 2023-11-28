//
//  TransitionBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 19/07/2023.
//

import SwiftUI

struct TransitionBootCamp: View {
    
    @State var showView : Bool = false
    
    var body: some View {
        ZStack (alignment: .bottom) {
            VStack {
                Button("Button Bloc") {
                    showView.toggle()
                }
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.purple)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)
                    ))
                    .animation(.easeInOut)
//                              .transition(AnyTransition.scale.animation(.easeInOut))
//              .transition(AnyTransition.opacity.animation(.easeInOut))
//                    .transition(.move(edge: .bottom))
//                    .animation(.easeOut)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct TransitionBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TransitionBootCamp()
    }
}
