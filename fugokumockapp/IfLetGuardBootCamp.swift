//
//  IfLetGuardBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 22/07/2023.
//

import SwiftUI

struct IfLetGuardBootCamp: View {
    
    @State var displayText: String?
    @State var isLoading: Bool = false
    @State var currentUserID: String? = "23"
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Here we are practicing safe coding")
               
                if let text = displayText {
                    Text("\(text)")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                
                if  isLoading {
                    ProgressView()
                }
                
                Spacer()
                
            }
            .navigationTitle("Safe Coding")
            .onAppear {
                loadDataTwo()
            }
        }
    }
    
    func loadData() {
        if let userID = currentUserID {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "This is the new user ID: \(userID)"
                isLoading = false
            }
        } else {
            displayText = "Error, there is no user ID"
        }
    
    }
    
    func loadDataTwo(){
        guard let userID = currentUserID else {
            displayText = "Error, there is no user ID"
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is the new user ID: \(userID)"
            isLoading = false
        }
    }
}

struct IfLetGuardBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        IfLetGuardBootCamp()
    }
}
