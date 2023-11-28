//
//  DocumentationBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 21/07/2023.
//

import SwiftUI

struct DocumentationBootCamp: View {
    
    // MARK: PROPERTIES
    
    @State var data: [String] = ["apples","bananna","oranges"]
    
    @State var showAlert: Bool = false
    
    // MARK: BODY
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                ForEach(data, id: \.self) { fruit in
                    Text("\(fruit)")
                        .font(.title)
                        .fontWeight(.heavy)
                }
            }
            
            .navigationTitle("Documentation")
            .navigationBarItems(trailing: Button("Alert"){
                showAlert.toggle()
            })
            
            .alert(isPresented: $showAlert, content: {
                showAlertFunc(text: "this is the alert")
            })
        }
        
    }
    
    // MARK: FUNCTIONS
    
    /// use three backs to add docsumentation to a view or anything at all
    ///
    /// ```
    ///     showAlertFunc(text: "this is the alert") -> Alert(title: Text("this is the alert"))
    /// ```
    /// - Warning: don't be a bitch
    /// - Parameter text: this holds the title for the alert
    /// - Returns: returns an Alert
    func showAlertFunc(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}

struct DocumentationBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootCamp()
    }
}
