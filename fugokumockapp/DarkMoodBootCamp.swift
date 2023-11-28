//
//  DarkMoodBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 21/07/2023.
//

import SwiftUI

struct DarkMoodBootCamp: View {
    
    @Environment(\.colorScheme) var colorSheme // set for locally adaptable color
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Testing Diffenet for primary")
                    .foregroundColor(.primary)
                    .font(.title)
                
                Text("Testing Diffenet for secondary")
                    .foregroundColor(.secondary)
                    .font(.title)
                
                Text("Font Color Apdaptive")
                    .foregroundColor(Color("AdaptiveColor")) // set adaptive color from color  assets 
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("Font Color Apdaptive")
                    .foregroundColor(
                        colorSheme == .light ? Color.yellow : Color.blue) // set adaptive color manually
                    .font(.title)
                    .fontWeight(.heavy)
                
//
            }
                .navigationTitle("Dark and Light Mood")
        }
        
    }
}

struct DarkMoodBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DarkMoodBootCamp()
                .preferredColorScheme(.light)
            DarkMoodBootCamp()
                .preferredColorScheme(.dark)
        }
    }
}
