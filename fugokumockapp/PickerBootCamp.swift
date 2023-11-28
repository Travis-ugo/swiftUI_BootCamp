//
//  PickerBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 21/07/2023.
//

import SwiftUI

struct PickerBootCamp: View {
    
    @State var pickerState: String = "18"
    let filterStyle: [String] = ["Selected","Popular","Liked"]

    init(){
        
        // using stuffs from UI kit
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.purple
        let attribute : [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attribute, for: .selected)
    }
    
    var body: some View {
        VStack {
       Text("Age : \(pickerState)")
            Picker(
                selection: $pickerState,
                label: Text("Picker"),
                content: {
                    ForEach(18..<88) { number in
                        Text("\(number)").tag("\(number)")
                    }
                }
            )
            .pickerStyle(WheelPickerStyle())
            
            Picker(
                selection: $pickerState,
                label: Text("Picker"),
                content: {
                    ForEach(filterStyle.indices) { index in
                        Text("\(filterStyle[index])").tag("\(filterStyle[index])")
                    }
                }
            )
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct PickerBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootCamp()
    }
}
