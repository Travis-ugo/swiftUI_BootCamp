//
//  ViewModelBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 22/07/2023.
//

import SwiftUI

struct FruitModel: Identifiable{
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    
    @Published var fruitArray: [ FruitModel] = []
    @Published var isLoading: Bool = false
    // the @Published plays the same role as the @State, however,
    // it is located in the Class not while the later is located
    // in a View or struct
    
    init() {
        getFruits()
    }
    
    func getFruits() {
         let fruit1 = FruitModel(name: "Apple", count: 21)
         let fruit2 = FruitModel(name: "Bananna", count: 51)
         let fruit3 = FruitModel(name: "Pear", count: 12)
         let fruit4 = FruitModel(name: "Corn", count: 41)
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.fruitArray.append(fruit4)
            self.isLoading = false
        }
    }
    
    func deletFruit(index: IndexSet){
        fruitArray.remove(atOffsets: index)
    }
    
}

struct ViewModelBootCamp: View {

//     @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    // use  @StateObject for a first time view or On creation or Initial use,
    // and @ObservedObject for subview
    
    var body: some View {
        NavigationView {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.red)
                            
                            Text(fruit.name)
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                    }
                    .onDelete(perform:  fruitViewModel.deletFruit)
                }
            }
            .navigationTitle("Model View")
            .navigationBarItems(
                trailing: NavigationLink(destination: SecondModelScreen( fruitViewModel: fruitViewModel), label: {
                    Image(systemName: "arrow.right")
                       .font(.title)
                })
            )
            .accentColor(Color.purple)
//            .onAppear {
//                fruitViewModel.getFruits()
//            }
        }
    }
}


struct SecondModelScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    HStack {
                        Text("\(fruit.count)")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.red)
                        
                        Text(fruit.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                }
                
               
            }
        }
    }
}
struct ViewModelBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelBootCamp()
//        SecondModelScreen()
    }
}
