//
//  ScrollViewReaderBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 02/08/2023.
//

import SwiftUI

struct ScrollViewReaderBootCamp: View {
    
    @State var textFieldHolder: String = ""
    
    @State var scrollIndex: Int = 0
    
    var body: some View {
        VStack {
            TextField("Type something cool here", text: $textFieldHolder)
                .padding()
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
                .padding(10)
                .keyboardType(.numberPad)
            
            Button("Click the Button") {
                if let index = Int(textFieldHolder) {
                    scrollIndex = index
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("Selected Text\(index)")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                            .padding(10)
                            .id(index)
                    }
                    .onChange(of: scrollIndex, perform: { value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value, anchor: .bottom)
                        }
                    })
                }
            }
          
        }
    }
}

struct ScrollViewReaderBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootCamp()
    }
}
