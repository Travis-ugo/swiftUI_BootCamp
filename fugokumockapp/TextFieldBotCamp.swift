//
//  TextFieldBotCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 20/07/2023.
//

import SwiftUI

struct TextFieldBotCamp: View {
    @State var textFieldText: String = ""
    @State var mutableList: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type a new word...", text: $textFieldText)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(Color.black)
                    .font(.headline)
                    .cornerRadius(15)
                
                Button(action: {
                    if textIsAppropriate() {
                        saveText()
                    }
                }, label: {
                    Text("Save Text")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ? Color.purple : Color.gray
                        )
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .cornerRadius(15)
                })
                .disabled(!textIsAppropriate())
                ForEach (mutableList, id: \.self){mutableItem in
                    Text(mutableItem)
                        .foregroundColor(Color.black)
                        .padding(.vertical, 10)
                    }
                Spacer()
            }
            .padding()
            .navigationTitle("Text Field BootCamp")
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count >= 3 {
            return true
        } else { return false }
    }
    func saveText(){
        mutableList.append(textFieldText)
        textFieldText = ""
    }
}

struct TextFieldBotCamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBotCamp()
    }
}
