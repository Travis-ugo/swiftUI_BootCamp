//
//  WeakSelfBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 08/08/2023.
//

import SwiftUI

class WeakSelfViewModel: ObservableObject {
    
    @Published var data: String? = nil
    
    init() {
        print("INITIALIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("DEINITIALIZE NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "NEW DATA!!!!!!!!"
        }
    }
    
}

struct WeakSelfBootCamp: View {
    
    @AppStorage("count") var count: Int?
    
    init() {
       count = 0
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink("Navigate", destination: WeakSelfScreen())
                .navigationTitle("Screen 1")
        }
        .overlay(
          Text("\(count ?? 0)")
            .font(.largeTitle)
            .padding()
            .background(Color.green.cornerRadius(10)),
         alignment: .topTrailing
        )
        
    }
}


struct WeakSelfScreen: View {
    
    @StateObject var vm =  WeakSelfViewModel()
    
    var body: some View {
        VStack {
            Text("SECOND SCREEN")
                .font(.headline)
                .foregroundColor(Color.red)
        }
    }
}


struct WeakSelfBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfBootCamp()
    }
}
