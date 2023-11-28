//
//  AccessabilityColorBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 27/11/2023.
//

import SwiftUI

struct AccessabilityColorBootCamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Button 1") {
                
            }
            .foregroundColor(.primary)
            .buttonStyle(.borderedProminent)
            
            Button("Button 2") {
                
            }
            .foregroundColor(.primary)
            .buttonStyle(.borderedProminent)
            .tint(Color.green)
            
            Button("Button 3") {
                
            }
            .foregroundColor(.primary)
            .buttonStyle(.borderedProminent)
            .tint(Color.orange)
            
            Button("Button 4") {
                
            }
            .foregroundColor(.primary)
            .buttonStyle(.borderedProminent)
            .tint(Color.purple)
        }
        .font(.largeTitle)
    }
}

struct AccessabilityColorBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AccessabilityColorBootCamp()
    }
}
