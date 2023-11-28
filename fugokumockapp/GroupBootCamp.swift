//
//  GroupBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 26/07/2023.
//
// episode 66
import SwiftUI

struct GroupBootCamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, World!")
            Group {
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .font(.headline)
            .foregroundColor(Color.red)
            .fontWeight(.black)
        }
        .foregroundColor(Color.green)
        .fontWeight(.medium)
        .font(.title)
    }
}

struct GroupBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GroupBootCamp()
    }
}
