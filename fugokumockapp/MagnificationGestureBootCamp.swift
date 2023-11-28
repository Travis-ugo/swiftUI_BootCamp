//
//  MagnificationGestureBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 31/07/2023.
//

import SwiftUI

struct MagnificationGestureBootCamp: View {
    
    @State var currentSize: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            HStack {
                Circle()
                    .fill(Color.purple)
                    .frame(width: 35)
                
                Text("Travis Okonicha")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal, 10)
            
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentSize +  lastAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentSize = value - 1

                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                currentSize = 0 
                            }
                        }
                    )
            
            HStack {
                Image(systemName: "heart")
                Image(systemName: "message")
                Spacer()
            }
            .padding(.horizontal, 10)
            
            Text("This is the comment section of the app")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
        }
        
//        Text("Hello, World!")
//            .font(.headline)
//            .foregroundColor(Color.white)
//            .padding(30)
//            .background(Color.red.cornerRadius(20))
//            .scaleEffect(1 + currentSize +  lastAmount)
//            .gesture(
//            MagnificationGesture()
//                .onChanged { value in
//                    currentSize = value - 1
//
//                }
//                .onEnded { value in
//                    lastAmount += currentSize
//                    currentSize = 0
//                }
//            )
    }
}

struct MagnificationGestureBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureBootCamp()
    }
}
