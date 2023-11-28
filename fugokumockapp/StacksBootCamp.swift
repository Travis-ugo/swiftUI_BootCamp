//
//  StacksBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 12/07/2023.
//
// this tutiorial, i learnt about the three main types of stacks in SwiftUI
import SwiftUI

struct StacksBootCamp: View {
    var body: some View {
        // ZStack
        // HStack
        VStack(
            alignment: .center,
            spacing: 10,
               content: {
            Rectangle()
                .fill(Color.purple)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
            
            }
        )
        
    }
}

struct StacksBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        StacksBootCamp()
    }
}
