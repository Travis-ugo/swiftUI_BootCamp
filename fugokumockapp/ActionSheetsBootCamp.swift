//
//  ActionSheetsBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 20/07/2023.
//

import SwiftUI

struct ActionSheetsBootCamp: View {
    
    @State var  showActionSheet: Bool = false
    @State var actionSheetOptions: ActionSheetEnum = .isOtherPost
    
    enum ActionSheetEnum {
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        
        
        VStack {
            HStack {
                Circle().body
                    .frame(width: 30, height: 30)
                Text("T.r.a.v.z_o.k.o.n.i.c.h.a")
                Spacer()
                Button(action: {
                    actionSheetOptions = .isOtherPost
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                })
            }
            .accentColor(.primary)
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
          
            .actionSheet(isPresented: $showActionSheet, content:{ showActionSheetFunc()})
        }
    }
    
    func showActionSheetFunc() -> ActionSheet {
        
        let shareButton: ActionSheet.Button = .default(Text("Share"))
        
        let reportButton: ActionSheet.Button = .destructive(Text("Report"))
        
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete"))
        
        let cancelButton: ActionSheet.Button = .cancel(Text("Cancel"))
        
        
        switch actionSheetOptions {
            
        case .isOtherPost:
            return ActionSheet(
                title: Text("What would you like to do?"),
                message: Text("Pick a chance"),
                buttons: [shareButton, cancelButton, reportButton]
            )
            
            
        case .isMyPost:
            return ActionSheet(
                title: Text("What would you like to do?"),
                message: Text("Pick a chance"),
                buttons: [shareButton, cancelButton, reportButton, deleteButton]
            )
        }
//        let actionSheetButton: [ActionSheet.Button] = [
//            .cancel(),
//            .destructive(Text("Destroy")),
//            .default(Text("Last man"))
//        ]
//
//        return ActionSheet(
//            title: Text("Bloc Boy"),
//            message: Text("Here lies the greatest man who ever lived"),
//            buttons: actionSheetButton
//        )
    }
}

struct ActionSheetsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetsBootCamp()
    }
}
