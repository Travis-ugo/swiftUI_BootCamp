//
//  ColorPickerBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 21/07/2023.
//

import SwiftUI

struct ColorPickerBootCamp: View {
    @State var colorPicker: Color = Color.purple
    
    var body: some View {
        ZStack {
            colorPicker
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Color value: \(colorPicker.description)")
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(20)
                    .padding()
                
                ColorPicker("Select a color",
                            selection: $colorPicker,
                            supportsOpacity: true
                )
                .padding()
                .foregroundColor(colorPicker)
                .background(Color.black)
                .cornerRadius(20)
                .padding()
            }
        }
    }
}

struct ColorPickerBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerBootCamp()
    }
}
