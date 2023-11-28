//
//  FrameBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 11/07/2023.
//
// learnt how to use frames in SwiftUI, and how they work
// while stacking them
import SwiftUI

struct FrameBootCamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(Color.red)
            .frame(width: 100, height: 100)
            .background(Color.green)
            .frame(width: 300, height: 300)
            .background(Color.orange)
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            .frame(height: 400)
            .background(Color.blue)
            .frame(maxHeight: .infinity)
            .background(Color.yellow)
    }
}

struct FrameBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        FrameBootCamp()
    }
}
