//
//  OnBoardingView.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 24/07/2023.
//

import SwiftUI

struct OnBoardingView: View {
    // OnBoarding states:
    /*
     when the onboarding state is
     0 - Welcome view
     1 - Add name
     2 - Add age
     3 - Add gender
     */
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    @State var onBoardingState: Int = 0
    
    // onboarding inputs
    @State var name: String = ""
    @State var age: Double = 20
    @State var gender: String = ""
    
    // for the alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            ZStack {
                switch onBoardingState {
                case 0:
                    welcomeSection
                        .transition( transition)
                case 1:
                    addNameSection
                        .transition( transition)
                case 2:
                    addAgeSection
                        .transition( transition)
                case 3:
                    addGenderSection
                        .transition( transition)
                default:
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                }
            }
            VStack {
                Spacer()
               
                bottomButton
                    
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .background(Color.purple)
    }
}

// MARK: COMPONENTS
extension  OnBoardingView {
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
           Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(Color.white)
            
            Text("Find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(Color.white),
                    alignment: .bottom
                )
            
            Text("Learning new concepts in swiftUI, using AppStorage")
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }

    private var addNameSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("What's your Name")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            TextField("your name here...", text: $name)
                .font(.headline)
                .foregroundColor(Color.black)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)

            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("What's your Age")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)

            
            Slider(value: $age, in: 18...99, step: 1)
                .accentColor(.white)

            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Picker(
                
                selection: $gender,
                
                label:
                    Text("Select a gender")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10),
                
                content: {
                    Text("Select a gender")
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
            })
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .accentColor(Color.purple)
            .pickerStyle(MenuPickerStyle())

            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var bottomButton: some View {
        Text(onBoardingState == 0 ? "Sign in":
                onBoardingState == 3 ? "FINISH" :
                "NEXT" )
            .font(.headline)
            .foregroundColor(Color.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .animation(nil)
            .onTapGesture {
                handleNextButtonPress()
            }
    }
}


// MARK: FUNCTIONS

extension OnBoardingView {
    func handleNextButtonPress() {
        
        switch onBoardingState {
        case 1:
            guard name.count >= 2 else {
                showAlert(title: "your name must be at least 3 letter long!! 🥲")
                return
            }
        
        case 3:
            guard !gender.isEmpty else {
                showAlert(title: "your name must select an option! 🥲")
                return
            }

            
        default:
            break
        }
       
        if onBoardingState == 3 {
            signIn()
        }
        else {
            withAnimation(.spring()) {
                onBoardingState += 1
            }
        }
    }
    
    func showAlert(title: String){
        alertTitle = title
        showAlert.toggle()
    }
    
    func signIn(){
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }
}
