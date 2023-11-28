//
//  ModelBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 22/07/2023.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let count: Int
    let isVerified: Bool
}

struct ModelBootCamp: View {
    
//    @State var users: [String] = ["Travis","Rodger","Pedro","Edra"]
    
    @State var usersModelList: [ UserModel ] = [
        UserModel(displayName: "Travis", userName: "T.r.a.v.i.s", count: 14, isVerified: true),
        UserModel(displayName: "Rodger", userName: "Roddy", count: 52, isVerified: false),
        UserModel(displayName: "Pedro", userName: "PamPee", count: 10, isVerified: true),
        UserModel(displayName: "Edra", userName: "Snow", count: 4, isVerified: false)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(usersModelList) { user in
                    HStack(spacing: 15) {
                        
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 35)
                        
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            
                            Text("@\(user.userName)")
                                .font(.caption)
                        }
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(Color.blue)
                        }
                        
                        
                        Spacer()
                        
                        VStack {
                            Text("\(user.count)")
                                .font(.headline)
                            
                            Text("Follower")
                                .foregroundColor(Color.gray)
                                .font(.caption)
                        }
                       
                        
                    }
                    .padding(.vertical, 5)
                }
                
//                ForEach(users,id: \.self) { user in
//                    HStack(spacing: 15) {
//
//
//                        Circle()
//                            .fill(Color.purple)
//                            .frame(width: 35)
//                        Text(user)
//                            .font(.headline)
//
//                        Spacer()
//                        Text("20")
//                            .font(.headline)
//                    }
//                    .padding(.vertical, 5)
//                }
            }
            
            .navigationTitle("Model Camp")
        }
    }
}

struct ModelBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ModelBootCamp()
    }
}
