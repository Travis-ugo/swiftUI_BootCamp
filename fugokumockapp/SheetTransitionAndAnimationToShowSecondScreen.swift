//
//  SheetTransitionAndAnimationToShowSecondScreen.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 19/07/2023.
//

import SwiftUI

struct SheetTransitionAndAnimationToShowSecondScreen: View {
    
    @State var showSecondScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            VStack {
                Button("Built In Button"){
                    showSecondScreen.toggle()
                }
                .font(.title)
                .foregroundColor(Color.white)
                
                Spacer()
            }
//            METHOD ONE : SHEET
//            .sheet(isPresented: $showSecondScreen, content: {
//                SecondScreenView()
//            })
            
//            METHOD TWO : TRANSITION
            
//            ZStack {
//                if showSecondScreen {
//                    SecondScreenView(showSecondScreen: $showSecondScreen)
//                        .padding(.top, 50)
//                        .cornerRadius(10)
//                        .transition(.move(edge: .bottom))
//                        .animation(.easeInOut)
//                }
//            }.zIndex(2.0)
            
//            METHOD THREE : ANIMATION OFFSET
            SecondScreenView(showSecondScreen: $showSecondScreen)
                .padding(.top, 50)
                .offset(y: showSecondScreen ? 0 : UIScreen.main.bounds.height)
                .animation(.spring())
                
            
        }
        .edgesIgnoringSafeArea(.bottom)
       
    }
}

struct  SecondScreenView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var  showSecondScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Color.gray
                .ignoresSafeArea()
            
            Button(action: {
//                presentationMode.wrappedValue.dismiss()
                showSecondScreen.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .padding(20)
            })
           
        }
    }
}

struct SheetTransitionAndAnimationToShowSecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SheetTransitionAndAnimationToShowSecondScreen()
    }
}
