//
//  AccessabilityTextBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 27/11/2023.
//

import SwiftUI

struct AccessabilityTextBootCamp: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0 ..< 10) { _ in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("welcome to Boys")
                                .truncationMode(.tail)
                        }
                        .font(.title)
                        
                        Text("THis is somw longer text for the boys and the multiline")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(3)
                            .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                    } .background(Color.red)
                }
            }
                .listStyle(PlainListStyle())
                .navigationTitle("Accessability")
        }
    }
}

extension ContentSizeCategory {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .extraSmall, .small, .medium:
            return 1.0
        case .large, .extraLarge, .extraExtraLarge:
            return 0.8
        default:
            return 0.5
        }
    }
}

struct AccessabilityTextBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AccessabilityTextBootCamp()
    }
}
