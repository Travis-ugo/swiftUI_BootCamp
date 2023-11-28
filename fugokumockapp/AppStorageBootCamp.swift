//
//  AppStorageBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 24/07/2023.
//

import SwiftUI

struct AppStorageBootCamp: View {

//    @State var currentUserName: String?
    
    @AppStorage("name")  var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(currentUserName ?? "Add Name Here")
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("Save".uppercased(), action: {
            let name = "Greek Freek"
                currentUserName =  name
//                UserDefaults.standard.set(name, forKey: "name") // old way of doing things
            })
        }
//        .onAppear {
//           currentUserName = UserDefaults.standard.string(forKey: "name")
//        }
        
    }
}

struct AppStorageBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootCamp()
    }
}
