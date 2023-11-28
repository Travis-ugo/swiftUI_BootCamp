//
//  TextEditorBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 20/07/2023.
//

import SwiftUI

struct TextEditorBootCamp: View {
    
    @State var textEditorController: String = "This is the text editor.."
    @State var savedText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorController)
                    .frame(height: 250)
                    .colorMultiply(.gray).opacity(0.4)
                    .cornerRadius(10)
            
                Button(action: {
                    savedText = textEditorController
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                })
                
                Text(savedText)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Text Editor")
        }
    }
}

struct TextEditorBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorBootCamp()
    }
}
