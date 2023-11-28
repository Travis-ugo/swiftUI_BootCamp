//
//  MenuBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 26/07/2023.
//

import SwiftUI

struct MenuBootCamp: View {
    var body: some View {
        Menu("Menu") {
            Button("Button 1"){}
            
            Button("Button 2"){}
            
            Button("Button 3"){}
            
            Button("Button 4"){}
        }
    }
}

struct MenuBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        MenuBootCamp()
    }
}
