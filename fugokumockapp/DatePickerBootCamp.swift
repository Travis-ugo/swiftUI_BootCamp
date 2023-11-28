//
//  DatePickerBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 21/07/2023.
//

import SwiftUI

struct DatePickerBootCamp: View {
    @State var dataPickerSelector: Date = Date()
    
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Date and Time:")
            Text("\(dateFormatter.string(from: dataPickerSelector))")
                .font(.headline)
                .fontWeight(.heavy)
            //        DatePicker("Select Date",selection: $dataPickerSelector, displayedComponents: [.date, .hourAndMinute])
               
            DatePicker("Select Date",selection: $dataPickerSelector, in: startingDate...endingDate ) // to lock date between range
                .accentColor(Color.purple)
                .datePickerStyle(.compact)
        }
        .padding()
    }
}

struct DatePickerBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootCamp()
    }
}
