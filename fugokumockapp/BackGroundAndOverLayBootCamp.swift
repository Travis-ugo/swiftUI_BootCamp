//
//  BackGroundAndOverLayBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 11/07/2023.
//
// this tutorial teaches me how to add overlay, and background to my UI
// overlay, also related to stacking in flutter, and using the align
// property to set an aligment position for the overlay object.
import SwiftUI

struct BackGroundAndOverLayBootCamp: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 50))
            .foregroundColor(Color.white)
            .background(
            Circle()
                .fill(
                    LinearGradient(colors: [Color.purple, Color.purple.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .frame(width: 100,height: 100)
                .shadow(color: Color.purple,radius: 10,x: 0.0,y: 10)
                .overlay(
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 35, height: 35)
                        .shadow(color: Color.blue,radius: 5,x: 3,y: 3 )
                        .overlay(
                            Text("4")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        )
                    ,alignment: .bottomTrailing
                )
            )
//        Rectangle()
//            .fill(Color.yellow)
//            .frame(width: 250, height: 250)
//            .overlay(
//                Rectangle()
//                    .fill(Color.orange)
//                    .frame(width: 150, height: 150)
//                , alignment: .topTrailing
//            )
//            .background(
//            Rectangle()
//                .fill(Color.gray)
//                .frame(width: 300, height: 300)
//            , alignment: .topTrailing
//            )
//        Circle()
//            .fill(Color.yellow)
//            .frame(width: 200, height: 200)
//            .overlay(
//            Text("23")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//             .foregroundColor(Color.white)
//            )
//            .background(
//                Circle()
//                    .fill(Color.orange)
//                    .frame(width: 230, height: 230)
//            )
            
// BackGorund Example
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .background(
//               Circle()
//                .fill( LinearGradient(colors: [Color.red, Color.blue], startPoint: .leading, endPoint: .trailing))
//                .frame(width: 100, height: 100)
//            )
//            .background(
//               Circle()
//                .fill( LinearGradient(colors: [Color.red, Color.blue], startPoint: .trailing, endPoint: .leading)
//                     )
//                .frame(width: 120, height: 120)
//            )
    }
}

struct BackGroundAndOverLayBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        BackGroundAndOverLayBootCamp()
    }
}
