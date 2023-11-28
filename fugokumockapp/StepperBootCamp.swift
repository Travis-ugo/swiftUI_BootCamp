//
//  StepperBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 21/07/2023.
//

import SwiftUI

struct StepperBootCamp: View {
    
    @State var stepperValue: Int = 10
    
    @State var stepperSubValue: CGFloat = 100
    
    var body: some View {
        VStack {
            Stepper("Stepper : \(stepperValue)", value: $stepperValue)
                .padding(50)
                .font(.headline)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: stepperSubValue, height: 100)
            
            Stepper("Stepper : \(stepperSubValue)",
                    onIncrement: {
                increamentBy(amount: 10)
            },
                    onDecrement: {
                increamentBy(amount: -10)
            })
                .padding(50)
            .font(.headline)

        }
    }
    
    func increamentBy(amount: CGFloat) {
        withAnimation(.easeOut) {
            stepperSubValue += amount
        }
    }
}

struct StepperBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootCamp()
    }
}

