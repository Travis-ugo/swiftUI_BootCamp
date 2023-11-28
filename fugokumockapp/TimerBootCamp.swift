//
//  TimerBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 08/09/2023.
//

import SwiftUI

struct TimerBootCamp: View {
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    @State var count : Int = 0
    
//    @State var currentDataTime: Date = Date()
//
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.timeStyle = .medium
//
//        return formatter
//    }
//
    var body: some View {
        ZStack {
//            Color.cyan
//                .ignoresSafeArea()
//            VStack {
//                Text(dateFormatter.string(from: currentDataTime))
//                    .font(.system(size: 100,weight: .semibold,  design: .rounded))
//                    .foregroundColor(Color.white)
//            }
//        }.onReceive(timer, perform: { value in
//            currentDataTime = value
//        })
            TabView(selection: $count, content: {
                Rectangle()
                    .foregroundColor(Color.purple)
                    .tag(1)
                Rectangle()
                    .foregroundColor(Color.cyan)
                    .tag(2)
                Rectangle()
                    .foregroundColor(Color.orange)
                    .tag(3)
                Rectangle()
                    .foregroundColor(Color.green)
                    .tag(4)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .tag(5)
            })
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle())
            }
        .onReceive(timer, perform: { _ in
            withAnimation(.default) {
                count = count == 5 ? 0 : count + 1
            }
                })
    }
}

struct TimerBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootCamp()
    }
}
