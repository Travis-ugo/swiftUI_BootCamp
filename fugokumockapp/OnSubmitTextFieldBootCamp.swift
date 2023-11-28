//
//  OnSubmitTextFieldBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 25/07/2023.
//

import SwiftUI

struct OnSubmitTextFieldBootCamp: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextField("Input some shit here ", text: $text)
            .padding()
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.gray.brightness(0.3))
            .cornerRadius(20)
            .padding(.horizontal)
            .submitLabel(.search)
            .onSubmit {
                print("actions here")
            }
    }
}

struct OnSubmitTextFieldBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        OnSubmitTextFieldBootCamp()
    }
}
