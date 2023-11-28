//
//  ListBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 20/07/2023.
//

import SwiftUI

struct ListBootCamp: View {
    
    @State var fruits: [String] = ["Apple", "Bananna", "Peach"]
    
    @State var veggies: [String] = ["Carrot", "Cabage", "Green Beans", "Tomato"]
    
    var body: some View {
       NavigationView {
            List {
                Section(
                    content: {
                        ForEach (fruits, id: \.self){ fruit in
                            Text(fruit)
                                .foregroundColor(Color.white)
                                .padding(.vertical, 10)
                            }
                        .onDelete(perform: onDelete)
                        .onMove(perform: onMove)
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
                
                Section(
                    content: {
                        ForEach (veggies, id: \.self){ veggie in
                            Text(veggie)
                                .foregroundColor(Color.white)
                                .padding(.vertical, 10)
                            }
                        .listRowBackground(Color.purple)

                          },
                    header: {
                    Text("Veggies")
                            .font(.headline)
                            .foregroundColor(Color.purple)
                    }
                )
            }
//            .accentColor(Color.green)
//            .listStyle(InsetGroupedListStyle())
            .navigationTitle("OGOGORO")
            .navigationBarItems(
                leading: EditButton(),
                trailing: addButton
            )
        }
       .accentColor(Color.purple)
    }
    
    var addButton: some View {
        Button("Add",
               action: {
                 onAdd()
            }
        )
    }
    
    func onDelete( indexSet: IndexSet){
        fruits.remove(atOffsets: indexSet)
    }
    func onMove(indices: IndexSet,  newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    func onAdd(){
        fruits.append("Carrot")
    }
}

struct ListBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootCamp()
    }
}
