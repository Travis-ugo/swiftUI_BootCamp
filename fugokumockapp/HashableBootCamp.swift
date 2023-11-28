//
//  HashableBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 03/08/2023.
//

import SwiftUI

struct CustomHashModel: Hashable {
    let title: String
    let subTitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subTitle)
    }
}

struct HashableBootCamp: View {
    
    var hashList: [CustomHashModel] = [
        CustomHashModel(title: "ONE", subTitle: "ONE SUBTITLE"),
        CustomHashModel(title: "TWO", subTitle: "TWO SUBTITLE"),
        CustomHashModel(title: "THREE", subTitle: "THREE SUBTITLE"),
        CustomHashModel(title: "FOUR", subTitle: "FOUR SUBTITLE"),
        CustomHashModel(title: "FIVE", subTitle: "FIVE SUBTITLE")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(hashList, id: \.self) { item in
                Text(item.title)
                Text(item.subTitle)
            }.font(.headline)
        }
    }
}

struct HashableBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootCamp()
    }
}
