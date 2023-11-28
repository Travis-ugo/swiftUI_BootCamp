//
//  LongPressGestureBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 31/07/2023.
//

import SwiftUI

struct LongPressGestureBootCamp: View {
    
    @State var isComplete: Bool = false
    
    @State var isAnimate: Bool = false
    
    var body: some View {
        VStack {
            
            Rectangle()
                .fill(isComplete ? Color.green : Color.blue)
                .frame(maxWidth: isAnimate ? .infinity : 0 )
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.brightness(0.3))
            
            
            HStack {
                Text("Click Now")
                    .font(.headline)
                       .foregroundColor(Color.white)
                       .padding()
                       .background(Color.green)
                       .cornerRadius(15)
                       .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50, perform: {
                           withAnimation(.easeInOut(duration: 1.0)){
                               isComplete = true
                           }
                         
                       },
                        onPressingChanged: { (isPressing) in
                           
                           if (isPressing) {
                               withAnimation(.easeInOut(duration: 1.0)){
                                   isAnimate = true
                               }
                           } else {
                               DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                                   if !isComplete {
                                       withAnimation(.easeInOut){
                                           isAnimate = false
                                       }
                                   }
                               })
                           }
                           
                       })
                
                Text("Reset")
                    .font(.headline)
                       .foregroundColor(Color.white)
                       .padding()
                       .background(Color.orange)
                       .cornerRadius(15)
                       .onLongPressGesture(minimumDuration: 0.5) {
                           withAnimation(.easeInOut(duration: 1.0)){
                               isAnimate = false
                               isComplete = false
                           }
                       }
            }
        }
        
        
//        Text(isComplete ? "COMPLETED" : "NOT COMPLET")
//            .font(.headline)
//            .foregroundColor(Color.white)
//            .padding()
//            .padding(.horizontal, 30)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(10)
////            .onTapGesture(count: 4,perform: {
////                isComplete.toggle()
////            })
//            .onLongPressGesture(minimumDuration: 2, perform: {
//                isComplete.toggle()
//            })
    }
}

struct LongPressGestureBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootCamp()
    }
}
