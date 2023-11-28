//
//  TypeAliasBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 08/08/2023.
//

import SwiftUI

struct TypeModels {
    let title: String
    let count: Int
    let direction: String
}

typealias Motenegro = TypeModels

struct TypeAliasBootCamp: View {
    
//    @State var typeAlias: TypeModels =  TypeModels(title: "Momo", count: 19, direction: "String of Type")
    
    @State var typeAlias: Motenegro =  Motenegro(title: "Momooo", count: 19, direction: "String of Type")
    
    var body: some View {
        VStack(spacing: 10) {
            Text(typeAlias.title)
            Text(typeAlias.direction)
            Text("\(typeAlias.count)")
        }
        .font(.headline)
    }
}

struct TypeAliasBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TypeAliasBootCamp()
    }
}
