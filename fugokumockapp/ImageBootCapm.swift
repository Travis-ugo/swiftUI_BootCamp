//
//  ImageBootCapm.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 11/07/2023.
//
// this tutorial, i learned how to add images, make the template, and edit their size, and frame.
import SwiftUI

struct ImageBootCapm: View {
    var body: some View {
        Image("jcole")
//            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
            .cornerRadius(10)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ImageBootCapm_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootCapm()
    }
}
