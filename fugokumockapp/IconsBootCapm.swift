//
//  IconsBootCapm.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 11/07/2023.
//
// this tutorial teaches you to add and edit my icons using the
// Image(systemName: "icon name from IOS icon design")

// use .font(.system(size: double)) to customise icon size
import SwiftUI

struct IconsBootCapm: View {
    var body: some View {
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
//            .font(.system(size: 200))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .foregroundColor(Color.purple)
            .frame(width: 200, height: 200)
            
            
    }
}

struct IconsBootCapm_Previews: PreviewProvider {
    static var previews: some View {
        IconsBootCapm()
    }
}
