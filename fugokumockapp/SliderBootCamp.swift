//
//  SliderBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 21/07/2023.
//

import SwiftUI

struct SliderBootCamp: View {
    @State var sliderValue: Double = 10.0
    
    @State var colorColor: Color = .blue
    
    var body: some View {
        VStack {
            Text("Slider Value: \(String(format: "%.0f", sliderValue))")
                .foregroundColor(colorColor)
//            Slider(value: $sliderValue)
//            Slider(value: $sliderValue, in: 0...100)
            Slider(value: $sliderValue, in: 0...10, step: 1)
                .accentColor(Color.purple)
            
            Slider(
                value: $sliderValue,
                in: 0...10,
                step: 1,
                onEditingChanged: {(_) in
                    colorColor = Color.purple
                },
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("5"),
                label: {
                    Text("Rating Slider")
                }
            )

                .accentColor(Color.purple)
        }
        .padding( )
    }
}

struct SliderBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootCamp()
    }
}
