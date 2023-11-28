//
//  SafeAreaInsets.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 26/07/2023.
//
// episode 65
import SwiftUI

struct SafeAreaInsetsBootCamp: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle()
                    .frame(height: 200)
            }
            .navigationTitle("Safe Area")
//            .overlay( // first way to do it
//                Text("HEllo")
//                    .frame(maxWidth: .infinity)
//                    .background(Color.yellow),
//                alignment: .bottom)
            
            
            .safeAreaInset(edge: .top, alignment: .trailing) {
                Text("HEllo")
//                    .frame(maxWidth: .infinity)
                    .padding()
                   .background(Color.yellow)
                   .clipShape(Circle())
            }
            
        }
        
    }
}

struct SafeAreaInsetsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaInsetsBootCamp()
    }
}
