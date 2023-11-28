//
//  TapGestureBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 22/07/2023.
//

import SwiftUI

struct TapGestureBootCamp: View {
    
    @State var rectangleToggle: Bool = false
    
    var body: some View {
        VStack(spacing: 40){
            RoundedRectangle(cornerRadius: 25)
//                .fill(rectangleColor)
                .frame(height: 200)
                .foregroundColor(rectangleToggle ? Color.purple :  Color.black)
            
            Button(action: {
                rectangleToggle.toggle()
            }, label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(25)
            })
            
            Text("Tap Gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(25)
                // the tap Gesture added
//                .onTapGesture {
//                    rectangleToggle.toggle()
//                }
//              this gesture performs an action if the user taps two time,
//              depending on the count number ande example is your instagram
//              feed, when you dobble tap on a post, you get to like it..
                .onTapGesture(count: 2,perform: {
                    rectangleToggle.toggle()
                })
                
            Spacer()
        } .padding(20)
    
    }
}

struct TapGestureBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureBootCamp()
    }
}
