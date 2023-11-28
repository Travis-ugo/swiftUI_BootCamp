//
//  BindingBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 19/07/2023.
//
// learnt about binding, and state injection in swift UI
// use the dollar sign to initialize the binded variable
import SwiftUI

struct BindingBootCamp: View {
    @State var systemBackGroundColor : Color = Color.gray
    @State var numberCount : Int = 2
    var body: some View {
        ZStack {
            systemBackGroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 200) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 100, height: 100)
                    .overlay(
                    Text("\(numberCount)")
                        .font(.title)
                        .fontWeight(.bold)
                    )
                
                StateChangeButtons(numberCount: $numberCount)
            }
        }
    }
}


struct StateChangeButtons: View {
    
    @Binding var numberCount: Int
    
    var body: some View {
        HStack(spacing: 200) {
            Button(action: { numberCount -= 1}, label: {
                Image(systemName: "minus")
                    .foregroundColor(Color.yellow)
                    .font(.largeTitle)
               
            })
            
            Button(action: { numberCount += 1 }, label: {
                Image(systemName: "plus")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
            })
        }
    }
}

struct BindingBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        BindingBootCamp()
    }
}
