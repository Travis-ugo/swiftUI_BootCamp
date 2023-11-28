//
//  ExtractionsFunctionBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 18/07/2023.
//

import SwiftUI

struct ExtractionsFunctionBootCamp: View {
    
    @State var backgorundColor: Color = Color.yellow
    @State var colorTitle: String = "Yellow"
    
    var body: some View {
        ZStack {
            backgorundColor
                .ignoresSafeArea()
            
            contetntView
        }
        
    }
    
    var contetntView: some View {
        VStack {
            Text(colorTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            Button(action: {
                onTap()
            }, label: {
                Text("Press Button".uppercased())
                    .foregroundColor(Color.white)
                    .font(.headline)
                    .padding(.vertical, 25)
                    .padding(.horizontal, 30)
                    .background(Color.black)
                    .cornerRadius(15)
            })
                
        }
    }
    
    func onTap() {
        if (backgorundColor == Color.yellow) {
            colorTitle = "Purple"
            backgorundColor = Color.purple
        } else {
            colorTitle = "Yellow"
            backgorundColor = Color.yellow
        }
    }
}

struct ExtractionsFunctionBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractionsFunctionBootCamp()
    }
}
