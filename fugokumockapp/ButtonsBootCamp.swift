//
//  ButtonsBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 18/07/2023.
//
// learnt alot about buttons thanks.
import SwiftUI

struct ButtonsBootCamp: View {
    
   @State var title : String = "This is the Title"
     
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Spacer()
            
            Button("Button Block".uppercased(), action: {
                self.title = "Button Number one was pressed"
            })
            .accentColor(.red)
            .padding(.bottom, 15)
            
            Button(action: {
                self.title = "The Big Blue Button was pressed"
            }, label: {
                Text("Berry Black".uppercased())
                    .foregroundColor(Color.white)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 25)
//                    .frame(width: 150, height: 70)
                    .background(Color.blue)
                    .cornerRadius(15)
            })
            
            Button(action: {
                self.title = "The #3 Button was pressed"
            }, label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 100, height: 100)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color.purple)
                    )
            })
            .padding(.vertical, 30)
            
            Button(action: {
                self.title = "The #4 Button was pressed"
            }, label: {
                Text("Capsule")
                    .foregroundColor(Color.gray)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding()
                    .padding(.horizontal, 15)
                    .background(
                    Capsule()
                        .stroke(Color.gray, lineWidth: 2.0)
                    )
                    
            })
            
            Spacer()
        }
    }
}

struct ButtonsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsBootCamp()
    }
}
