//
//  SpacerBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 18/07/2023.
//

import SwiftUI

struct SpacerBootCamp: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                Spacer(minLength: 5)
                    .frame(height: 10)
                    .background(Color.orange)
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50)
                Spacer()
                    .frame(height: 10)
                    .background(Color.orange)
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: 50, height: 50)
            }
            .padding(.all, 10)
        .background(Color.blue)
            
         Spacer() 
        }
    }
}

struct SpacerBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        SpacerBootCamp()
    }
}
