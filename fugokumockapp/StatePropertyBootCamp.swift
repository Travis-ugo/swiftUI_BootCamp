//
//  StatePropertyBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 18/07/2023.
//

import SwiftUI

struct StatePropertyBootCamp: View {
    @State var count : Int = 0
    @State var backGroundColor : Color = Color.white
    
    var body: some View {
        ZStack {
            backGroundColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("\(count)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                HStack {
                    Button(
                        action: {
                            backGroundColor = Color.green
                         count -= 1
                        }, label: {

                            Circle()
                                .fill(Color.red)
                                .frame(width: 80, height: 80)
                                .overlay(
                                Image(systemName: "minus")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                                )
                        }
                    )
                    
                    Spacer()
                    
                    Button(
                        action: {
                            backGroundColor = Color.purple
                            count += 1
                        }, label: {

                            Circle()
                                .fill(Color.blue)
                                .frame(width: 80, height: 80)
                                .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                                )
                        }
                    )
                    
                }
                .padding(.horizontal, 30)
                Spacer()
            }
        }
    }
}

struct StatePropertyBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        StatePropertyBootCamp()
    }
}
