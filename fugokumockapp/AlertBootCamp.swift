//
//  AlertBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 20/07/2023.
//

import SwiftUI

struct AlertBootCamp: View {
    
    @State var isAlert : Bool = false
    @State var backGroundColor: Color = Color.purple
    
    var body: some View {
        ZStack {
            backGroundColor
                .ignoresSafeArea()
            
            Button("Alert Button"){
                isAlert.toggle()
            }
            .font(.title)
            .foregroundColor(Color.white)
            .alert(isPresented: $isAlert, content: {alert()})
        }
    }
    // use these keys to pop the emoji block:   control + command +  spacebar
    func alert() -> Alert {
       return Alert(
            title: Text("The title"),
            message: Text("Here lies the message for the alert"),
            primaryButton: .destructive(Text("Delete"), action: {
                backGroundColor = Color.yellow
            }),
            secondaryButton: .cancel(
                Text("Bloc"),
                action: {
                    backGroundColor = Color.purple
            })
        )
//        Alert(title: Text("First show alert ever seen"))
    }
}

struct AlertBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AlertBootCamp()
    }
}
