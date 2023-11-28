//
//  ResizebleSheetBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 26/07/2023.
//
// episode 64

import SwiftUI

struct ResizebleSheetBootCamp: View {
    
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large
    
    var body: some View {
        Button("Click me for sheets") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            MyNextScreen(detents: $detents)
                .presentationDetents([.fraction(0.2),.medium,.height(600), .large])
//                .presentationDragIndicator(.hidden)
//                .interactiveDismissDisabled()
        }
    }
}



struct MyNextScreen: View {
    
    @Binding var detents: PresentationDetent
    
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Button("20%") {
                    detents = .fraction(0.2)
                }
                
                Button("LARGE") {
                    detents = .large
                }
                
                Button("HEIGHT") {
                    detents = .height(600)
                }
                
                Button("MEDIUM") {
                    detents = .medium
                }
            }
        }
        .accentColor(Color.white)
    }
}

struct ResizebleSheetBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ResizebleSheetBootCamp()
    }
}
