//
//  SortFilterMapBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 03/08/2023.
//

import SwiftUI

struct UserModels: Hashable {
    let name: String
    let points: Int
    let isVerified: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine("\(name)\(points)")
    }
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModels] = []
    @Published var filteredArray: [UserModels] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredaArray()
    }
    
    func updateFilteredaArray() {
        
        /* SORTED
         
        filteredArray = dataArray.sorted { (first, second) -> Bool in
            return first.points < second.points
        }
        filteredArray = dataArray.sorted(by: { $0.points < $1.points}) short hand
        */
        
        /* FILTER
        filteredArray = dataArray.filter( { (user) -> Bool in
            return user.isVerified
        } )
        
        filteredArray = dataArray.filter( { $0.isVerified } ) short hand
        */
        
        /* MAP
        mappedArray = dataArray.map( { (user) -> String in
            return user.name
        } )
        mappedArray = dataArray.map( { $0.name } ) short hand
        */
        /*
        mappedArray = dataArray.compactMap( { (user) -> String? in
            return user.name
        } )
        mappedArray = dataArray.compactMap( {$0.name} )
        */
        
        mappedArray =  dataArray
                            .sorted(by: { $0.points < $1.points})
                            .filter( { $0.isVerified } )
                            .compactMap( {$0.name} )
                            
        
        
        
    }
    
    func getUsers() {
        let user1 = UserModels(name: "Travis", points: 16, isVerified: false)
        let user2 = UserModels(name: "Nick", points: 6, isVerified: true)
        let user3 = UserModels(name: "Pimp", points: 11, isVerified: false)
        let user4 = UserModels(name: "Jason", points: 10, isVerified: true)
        let user5 = UserModels(name: "Stella", points: 2, isVerified: false)
        let user6 = UserModels(name: "Beans", points: 8, isVerified: true)
        
        dataArray.append(contentsOf: [user1, user2, user3, user4, user5, user6 ] )
    }
}

struct SortFilterMapBootCamp: View {
    
    @StateObject var viewModel = ArrayModificationViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            
            ForEach(viewModel.mappedArray, id: \.self) {userName in
                Text(userName)
                    .font(.title)
            }
//            ForEach(viewModel.filteredArray, id: \.self) { user in
//                VStack(alignment: .leading, spacing: 10) {
//                    Text(user.name)
//                    HStack {
//                        Text("Points: \(user.points)")
//                        Spacer()
//                        if user.isVerified {
//                            Image(systemName: "flame.fill")
//                        }
//                    }
//                }
//            }
//            .foregroundColor(Color.white)
//            .padding(15)
//            .background(Color.blue.cornerRadius(15))
//            .padding(.horizontal, 10)
            
            Spacer()
        } .padding(.top, 30)
    }
}

struct SortFilterMapBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        SortFilterMapBootCamp()
    }
}
