//
//  ProfileView.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 25/07/2023.
//

import SwiftUI

struct ProfileView: View {
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image("jcole")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(100)
            
            Text(currentUserName ?? "Jcole")
            Text("This user is \(currentUserAge ?? 0) years old!")
            Text("Their gender is \(currentUserGender ?? "unknow") gender")
            
            Text("Sign Out")
                .font(.title3)
                .foregroundColor(Color.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
                .onTapGesture {
                    signOut()
                }
        }
        .font(.title3)
        .foregroundColor(Color.purple)
        .padding()
        .padding(.vertical, 40)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(25)
    }
    
    func signOut(){
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
