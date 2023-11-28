//
//  ForEachBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 18/07/2023.
//

import SwiftUI

struct ForEachBootCamp: View {
    
    let data: [String] = ["Black", "Apple", "Song"]
    
    var body: some View {
        VStack (alignment: .leading) {
//            ForEach(0..<10) { index in
//                Text("\(index) Berry")
//                    .fontWeight(.bold)
//                    .font(.title)
//
//            }
            ForEach(data.indices,  id:\.self) { index in
                Text("\(data[index]) Berry")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.vertical, 10)
            }
        }
        
    }
}

struct ForEachBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ForEachBootCamp()
    }
}
