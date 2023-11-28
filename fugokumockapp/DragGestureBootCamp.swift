//
//  DragGestureBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 31/07/2023.
//

import SwiftUI

struct DragGestureBootCamp: View {
    
    @State var offSet: CGSize = .zero
    
    var body: some View {

        ZStack {
            VStack {
                Text("\(offSet.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offSet)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offSet = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                offSet = .zero
                            }
                        }
            )
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offSet.width)
        let percentage = currentAmount / max
        
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offSet.width
        let percentage = currentAmount / max
        let percentageAsDounle = Double(percentage)
        let maxAngle: Double = 10
        
        return percentageAsDounle * maxAngle
    }
}

struct DragGestureBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootCamp()
    }
}
