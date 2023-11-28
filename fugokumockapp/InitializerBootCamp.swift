//
//  InitializerBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 18/07/2023.
//

import SwiftUI

struct InitializerBootCamp: View {
    let backgroundColor: Color
    let titleCount: Int
    let subTitle: String?
    
//    init(titleCount: Int, subTitle: String?)
//
//    {
////        self.backgroundColor = backgroundColor
//        self.titleCount = titleCount
//        self.subTitle = subTitle
//
//        if (subTitle == "Purple"){
//
//            self.backgroundColor = Color.purple
//
//        }
//        else if (subTitle == "Orange"){
//
//            self.backgroundColor = Color.orange
//
//        }  else {
//
//            self.backgroundColor = Color.blue
//
//        }
//
//    }
    
    init(titleCount: Int, fruit: Fruit)
    
    {
//        self.backgroundColor = backgroundColor
        self.titleCount = titleCount
       
        if (fruit == .apple){
            
            self.subTitle = "Apples"
            self.backgroundColor = Color.purple
            
        }
        else {
            
            self.subTitle = "Orange"
            self.backgroundColor = Color.orange
            
        }
        
    }
    
    enum Fruit {
        case apple
        case orange
    }
    
    var body: some View {
        VStack(spacing: 12) {
          Text("\(titleCount)")
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .underline()
            Text(subTitle ?? "Black Berry")
                .font(.headline)
                .foregroundColor(Color.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
      
        
    }
}

struct InitializerBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            InitializerBootCamp(titleCount: 123, fruit: .orange)
            InitializerBootCamp(titleCount: 321, fruit: .apple)
        }
    }
}
