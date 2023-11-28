//
//  MultipleSheetsBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 02/08/2023.
//

import SwiftUI

struct  RandomModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
}

struct MultipleSheetsBootCamp: View {
    
//    @State var showSheet: Bool = false
//
//    @State var showSheet2: Bool = false
//
//    @State var selectableModel = RandomModel(title: "Starting String".uppercased())
    
    @State var selectableModel: RandomModel? = nil
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<20) { index in
                    Button("Button \(index)") {
                        selectableModel = RandomModel(title: "\(index)")
                    }
                    .padding()
                }
                
    //            Button("Button 1") {
    //                selectableModel = RandomModel(title: "ONE")
    //            }
    //
    //            Button("Button 2") {
    //                selectableModel = RandomModel(title: "TWO")
    //            }
            }
            .sheet(item: $selectableModel, content: { model in
                NextMutilpleSheetView(selectableModel: model)
        })
        }
//        VStack {
//            Button("Button 1") {
//                showSheet.toggle()
//                selectableModel = RandomModel(title: "ONE")
//            }
//            .sheet(isPresented: $showSheet, content: {
//                NextMutilpleSheetView(selectableModel: RandomModel(title: "ONE"))
//            })
//
//            Button("Button 2") {
//                showSheet2.toggle()
////                selectableModel = RandomModel(title: "TWO") // first way
//            }
//            .sheet(isPresented: $showSheet2, content: {
//                NextMutilpleSheetView(selectableModel: RandomModel(title: "TWO"))
//            })
//        }
//        .sheet(isPresented: $showSheet, content: {
////            NextMutilpleSheetView(selectableModel: $selectableModel) // first way
//            NextMutilpleSheetView(selectableModel: selectableModel)
//
//        })
    }
}

struct NextMutilpleSheetView: View {
    
//    @Binding var selectableModel: RandomModel // first way
    let selectableModel: RandomModel

    
    var body: some View {
        Text(selectableModel.title)
    }
}

struct MultipleSheetsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootCamp()
    }
}
