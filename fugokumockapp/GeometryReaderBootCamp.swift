//
//  GeometryReaderBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 02/08/2023.
//
// continue learning episode #6
import SwiftUI

struct GeometryReaderBootCamp: View {
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content:  {
            HStack {
                ForEach(0..<20) {index in
                    GeometryReader { geometryProxy in
                        RoundedRectangle(cornerRadius: 10)
                            .rotation3DEffect(Angle(degrees: getPercentage(geo: geometryProxy) * 40), axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        })

//        GeometryReader { geometryProxy in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: geometryProxy.size.width * 0.6666)
//                Rectangle()
//                    .fill(Color.blue)
//            }
//        }.ignoresSafeArea()
    }
}

struct GeometryReaderBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootCamp()
    }
}
