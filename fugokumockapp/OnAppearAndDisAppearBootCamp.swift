//
//  OnAppearAndDisAppearBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 21/07/2023.
//

import SwiftUI

struct OnAppearAndDisAppearBootCamp: View {
    
    @State var myText: String = "starting text"
    @State var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<30) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    myText = "This is the new text mate"
                }
            })
            .onDisappear(perform: {
                myText = "End all active text change"
            })
            .navigationTitle("OnAppear: \(count)")
        }
    }
}

struct OnAppearAndDisAppearBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearAndDisAppearBootCamp()
    }
}
