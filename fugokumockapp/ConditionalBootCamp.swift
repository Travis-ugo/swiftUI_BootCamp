//
//  ConditionalBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 19/07/2023.
//

import SwiftUI

struct ConditionalBootCamp: View {
    
    @State var showCircle : Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Button("Circle toggel : \(showCircle.description.uppercased())") {
                showCircle.toggle()
            }
            
            if showCircle {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
            } else {
                ProgressView()
            }
        }
        
    }
}

struct ConditionalBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalBootCamp()
    }
}
