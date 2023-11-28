//
//  ContentView.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 07/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Bloc boy its me again!")
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
