//
//  ListSweepActionBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 25/07/2023.
//

import SwiftUI

struct ListSweepActionBootCamp: View {
    
    @State var fruits: [String] = ["Apple", "Bananna", "Peach"]
    
    var body: some View {
        List {
            Section(
                content: {
                    ForEach (fruits, id: \.self){
                        Text($0)
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true,content: {
                                Button("Archive") {
                                    
                                }
                                
                                Button("Save") {
                                    
                                }
                                .tint(Color.blue)
                                
                                Button("Share") {
                                    
                                }
                                .tint(Color.green)
                            })
                            .swipeActions(edge: .leading, allowsFullSwipe:true,content: {
                                Button("share") {
                                }.tint(Color.yellow)
                            })
                        }
//                    .onDelete(perform: onDelete)
                    .listRowBackground(Color.purple)
                      },
                header: {
                    HStack {
                        Text("Fruits")
                        Image(systemName: "flame")
                    }
                    .font(.headline)
                    .foregroundColor(Color.purple)
                }
            )
        }
    }
    func onDelete(index: IndexSet) {}
}

struct ListSweepActionBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ListSweepActionBootCamp()
    }
}
