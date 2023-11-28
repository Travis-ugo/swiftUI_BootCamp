//
//  Multi_TreadingBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 08/08/2023.
//

import SwiftUI

class BackgroundTreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetch() {
        DispatchQueue.global(qos: .background).async {
            
            let newData = self.downloadData()
            print("CHECK 1: \(Thread.isMainThread)")
            print("CHECK 1: \(Thread.current)")
            
            DispatchQueue.main.async {
                self.dataArray = newData
                print("CHECK 2: \(Thread.isMainThread)")
                print("CHECK 2: \(Thread.current)")
            }
        }
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        
        for x in 0..<100 {
            data.append("\(x)")
        }
        return data
    }
}

struct Multi_TreadingBootCamp: View {
    
    @StateObject var vm: BackgroundTreadViewModel = BackgroundTreadViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .onTapGesture {
                        vm.fetch()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    
                    Text(item)
                        .font(.headline)
                }
            }
        }
    }
}

struct Multi_TreadingBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        Multi_TreadingBootCamp()
    }
}
