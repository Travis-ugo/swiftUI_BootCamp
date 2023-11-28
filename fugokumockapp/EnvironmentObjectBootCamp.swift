//
//  EnvironmentObjectBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 22/07/2023.
//

import SwiftUI


class EnvironmentObjectBootCampModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["IPhone","IPad","IMac","MacOS"])
    }
}

struct EnvironmentObjectBootCamp: View {
    
    @StateObject var viewModel: EnvironmentObjectBootCampModel = EnvironmentObjectBootCampModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(destination: {
                        DetailsView(selectedItem: item)
                    }, label: {
                        Text(item)
                    })
                }
            }
            
            .navigationTitle("IOS Devices")
        }
        
        .environmentObject(viewModel)
    }
}

struct DetailsView: View {
    
    var selectedItem: String
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
            NavigationLink(destination: {
                DetailsThirdView()
            }, label: {
                Text(selectedItem)
                    .font(.headline)
                .foregroundColor(Color.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(Color.white)
                    .cornerRadius(30)
            })
                
        }
    }
}


struct DetailsThirdView: View {
    
    @EnvironmentObject var viewModel: EnvironmentObjectBootCampModel
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundColor(Color.white)
                        
                }
                Text("selectedItem")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(30)
            }
                
        }
    }
}

struct EnvironmentObjectBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectBootCamp()
    }
}
