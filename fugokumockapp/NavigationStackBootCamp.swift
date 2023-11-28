//
//  NavigationStack.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 25/07/2023.
//

// episode 62

import SwiftUI

struct NavigationStackBootCamp: View {
    
    let fruits: [String] = ["Apple","Orange","Bannana","PineApple",]
    
    @State private var stackPath: [String] = []
    
    var body: some View {
//        NavigationStack(path: $stackPath) {
        NavigationStack {
            ScrollView {
                VStack(spacing: 40) {
                    Button("Super bowl") {
                        stackPath.append(contentsOf: ["pear","watermellon","mango"])
                    }
                    
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink( value: fruit) {
                            Text(fruit)
                        }
                    }
                    
                    ForEach(0..<5) { x in
                        NavigationLink(value: x) {
                            Text("Click me \(x)")
                        }
                    }
                }
            }
            .navigationTitle("NavStack Camp")
            .navigationDestination(for: Int.self) { value in
                NavStackSecondScreen(value: value)
            }
            .navigationDestination(for: String.self) { value in
                Text("Another screen \(value)")
            }
        }
    }
}

struct NavigationStackBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackBootCamp()
    }
}


struct NavStackSecondScreen: View {
    var value: Int
    var body: some View {
        Text("The new screen Value \(value)")
    }
}
