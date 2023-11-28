//
//  DragGestureBootCampPartTwo.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 02/08/2023.
//

import SwiftUI

struct DragGestureBootCampPartTwo: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    
    @State var currentDragOffset: CGFloat = 0
    
    @State var endingDragOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffset)
                .offset(y: endingDragOffset)
                .gesture(
                    DragGesture()
                        .onChanged {value in
                            withAnimation(.spring()) {
                                currentDragOffset = value.translation.height
                            }
                        }
                        .onEnded {value in
                            withAnimation(.spring()) {
                                if currentDragOffset < -150 {
                                    endingDragOffset = -startingOffsetY
                                } else if endingDragOffset != 0 && currentDragOffset > 150 {
                                    endingDragOffset = 0
                                }
                            currentDragOffset = 0
                            }
                        }
                )
//
//            Text("\(currentDragOffset)")
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct DragGestureBootCampPartTwo_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootCampPartTwo()
    }
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
               
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the discription for our application This is the discription for our application applicationThis is the discription for our application")
                .multilineTextAlignment(.center)
            
            Text("Create an Account" )
                .font(.headline)
                .foregroundColor(Color.white)
                .padding()
                .padding(.horizontal)
                .background(Color.black)
                .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
       
    }
}
