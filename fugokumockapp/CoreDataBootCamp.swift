//
//  CoreDataBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 05/08/2023.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    @Published var savedEntitited: [FruitEntity] = []
    
    let containter: NSPersistentContainer
    
    init() {
        containter = NSPersistentContainer(name: "FruitsContainer")
        containter.loadPersistentStores { ( description, error ) in
            if let error = error {
                print("ERROR LOADING CORE DATA \(error)")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            savedEntitited = try containter.viewContext.fetch(request)
        } catch let error {
            print("ERROR OCCURED \(error)")
        }
        
    }
    
    func addFruit(text: String) {
        
        let newFruit = FruitEntity(context: containter.viewContext)
        newFruit.name = text
        saveData()
        
    }
    
    func deletFruit(index: IndexSet) {
        
        guard let index = index.first else { return }
        let entity = savedEntitited[index]
        containter.viewContext.delete(entity)
        saveData()
        
    }
     
    func updateFruit(entity: FruitEntity) {
        
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
        
    }
    
    func saveData() {
        do {
            try containter.viewContext.save()
            fetchFruits()
        } catch let error {
            print("ERROR OCCURED WHILE SAVING DATA \(error)")
        }
    }
    
}

struct CoreDataBootCamp: View {
    
    @StateObject var vm =  CoreDataViewModel()
    
    @State var textFieldController = ""
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 20) {
                TextField("add fruits", text: $textFieldController)
                    .padding()
                    .background(Color.gray.brightness(0.3).cornerRadius(10))
                    .padding(.horizontal)
                
                Button(
                    
                    action: {
                        
                    guard !textFieldController.isEmpty else { return }
                    vm.addFruit(text: textFieldController)
                    textFieldController = ""
                        
                    },
                    
                    label: {
                        
                    Text("Add Button")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.purple.cornerRadius(10))
                        .padding(.horizontal)
                })
        
                List {
                    ForEach(vm.savedEntitited) { entity in
                        Text(entity.name ?? "" )
                            .onTapGesture {
                                vm.updateFruit(entity: entity)
                            }
                    }
                   
                    .onDelete(perform: vm.deletFruit)
                }
                  .listStyle(PlainListStyle())
        
            }
            
                .navigationTitle("Fruits")
        }
    }
}

struct CoreDataBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootCamp()
    }
}
