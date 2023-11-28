//
//  SheetsBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 19/07/2023.
//

import SwiftUI

struct SheetsBootCamp: View {
    @State var showSheet :Bool = false
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(10)
            })
            
            .fullScreenCover(isPresented: $showSheet, content: {
//              no conditional logic here. NO IF ELSE
                SecondScreen()
            })
//             only one per view
//            .sheet(isPresented: $showSheet, content: {
//                no conditional logic here. NO IF ELSE
//                SecondScreen()
//            })
        }
    }
}

struct SecondScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.gray
                .ignoresSafeArea()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
               Image(systemName: "xmark")
                    .foregroundColor(Color.white)
                    .font(.title)
            })
            .padding(30)

        }
    }
}

struct SheetsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        SheetsBootCamp()
    }
}
