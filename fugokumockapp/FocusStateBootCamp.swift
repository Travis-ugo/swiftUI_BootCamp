//
//  FocusStateBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 25/07/2023.
//

import SwiftUI

struct FocusStateBootCamp: View {
    
    enum OnBoardingField: Hashable {
        case userName
        case password
    }
    
    @State private var userName: String = ""
//    @FocusState private var userNameInFocus: Bool
    @State private var password: String = ""
//    @FocusState private var passwordInFocus: Bool
    @FocusState private var fieldsFocus : OnBoardingField?
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Add your name here...", text: $userName)
                .focused($fieldsFocus, equals: .userName)
//                .focused($userNameInFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            SecureField("Add your password here...", text: $password)
                .focused($fieldsFocus, equals: .password)
//                .focused($passwordInFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            Button("Sing Up") {
                let userNameIsValid = !userName.isEmpty
                let passwordIsValid = !password.isEmpty
                
                if userNameIsValid && passwordIsValid {
                    print("Signed IN")
                } else if  userNameIsValid {
                    fieldsFocus = .password
//                    userNameInFocus = false
//                    passwordInFocus = true
                } else {
                    fieldsFocus = .userName

//                    userNameInFocus = true
//                    passwordInFocus = false
                }
                
            }
            
//            Button("Toggle FOcus State") {
//                userNameInFocus.toggle()
//            }
        }
        .padding(40)
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                self.userNameInFocus = true
//            }
//        }
    }
}

struct FocusStateBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateBootCamp()
    }
}
