//
//  ToggleBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 21/07/2023.
//

import SwiftUI

struct ToggleBootCamp: View {
    
    @State private var toggleIsOn = true
    
    var body: some View {
        VStack {
            HStack {
                Text("Status: ")
                Text(toggleIsOn ? "Online": "Offline")
            }
            Toggle(
                isOn: $toggleIsOn,
                label: {
                    Text("Toggle Label")
                }
                    
            )
            .padding(.horizontal, 100)
            .toggleStyle(SwitchToggleStyle(tint: Color.purple))
            Spacer()
        }
        .padding()
    }
}

struct ToggleBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootCamp()
    }
}
