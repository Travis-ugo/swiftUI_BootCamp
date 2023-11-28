//
//  IntroductionView.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 24/07/2023.
//

import SwiftUI

struct IntroductionView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                Color.purple,
                Color.black],
                startPoint: .top,
                endPoint: .bottom
                
            ).ignoresSafeArea()
            
            if currentUserSignedIn {
                // profile View
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                    
            } else {
                OnBoardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
        } .foregroundColor(Color.white)
            .font(.headline)
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View { 
        IntroductionView()
    }
}
