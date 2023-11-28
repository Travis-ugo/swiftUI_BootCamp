//
//  TabViewBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 21/07/2023.
//

import SwiftUI

struct TabViewBootCamp: View {
    
    @State var selectedTabItem: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTabItem) {
            HomeView(selectableTab: $selectedTabItem)
                .tabItem {
                    Image(systemName: "home")
                        .font(.title)
                    Text("Home")
                }
                .tag(0)
            
            Text("Page Two")
                .tabItem {
                    Image(systemName: "globe")
                        .font(.title)
                    Text("Browse")
                }
                .tag(1)
            
            Text("Page Three")
                .tabItem {
                    Image(systemName: "person")
                        .font(.title)
                    Text("Profile")
                }
                .tag(2)
        }
        .tabViewStyle(.automatic)
        .accentColor(Color.green)
    }
}

struct HomeView: View {
    @Binding var selectableTab: Int
    
    var body: some View {
        ZStack{
            Color.yellow
                .ignoresSafeArea()
            
            VStack{
                Text("Home Page")
                    .foregroundColor(Color.black)
                    .fontWeight(.heavy)
                    .font(.title)
                    
                Button(action: {
                    selectableTab = 2
                }, label: {
                    Text("Button")
                        .foregroundColor(Color.black)
                        .fontWeight(.heavy)
                        .padding()
                        .padding(.horizontal, 10)
                        .background(Color.white)
                        .cornerRadius(10)
                        
                })
            }
        }
    }
}

struct TabViewBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBootCamp()
    }
}
