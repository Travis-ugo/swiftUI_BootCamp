//
//  BadgesBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 25/07/2023.
//

import SwiftUI

struct BadgesBootCamp: View {
    var body: some View {
        List {
            Text("Hello World")
                .badge(20)
            Text("Hello World")
                .badge("Can also be a string")
            Text("Hello World")
                .badge("Blco")
            Text("Hello World")
        }
        
//        TabView {
//            Color.red
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Home")
//                }
//                .badge(2)
//
//            Color.purple
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Home")
//                }
//                .badge(22)
//
//
//            Color.green
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Home")
//                }
//                .badge(1002)
//        }
    }
}

struct BadgesBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        BadgesBootCamp()
    }
}
