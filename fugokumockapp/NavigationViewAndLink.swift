//
//  NavigationViewAndLink.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 19/07/2023.
//

import SwiftUI

struct NavigationViewAndLink: View {
    var body: some View {
        NavigationView {
            
            ScrollView {
                NavigationLink("Navigate to second screen",
                               destination: SecondNavigationViewScreen())
                .font(.headline)
                .foregroundColor(Color.green)
            }
            
            .navigationTitle("First Page")
            
            .navigationBarTitleDisplayMode(.automatic)
            
            .navigationBarBackButtonHidden(false)
            
            .navigationBarItems(
                leading: NavigationLink(
                    destination: SecondNavigationViewScreen(),
                    label: {
                        Image(systemName: "arrowshape.backward")
                    }
                ),
                
                trailing:    NavigationLink(
                    destination: SecondNavigationViewScreen(),
                    label: {
                        Image(systemName: "arrowshape.right")
                    }
                )
                .accentColor(.red)
                
            )
        }
    }
}

struct SecondNavigationViewScreen: View {
    
    @Environment(\.presentationMode) var presenmtationMode
    
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            
                .navigationTitle("Second Screen")
                
            VStack {
                Text("Second Screen")
                    .foregroundColor(Color.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                
                Button(action: {
                    presenmtationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "heart")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                })
            }
        }
    }
}

struct NavigationViewAndLink_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewAndLink()
    }
}
