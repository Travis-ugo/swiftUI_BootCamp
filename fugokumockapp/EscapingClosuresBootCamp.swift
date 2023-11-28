//
//  EscapingClosuresBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 09/08/2023.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData5 { [weak self] (returnedResult) in
            self?.text = returnedResult.data
        }
    }
    
    func  downloadData() -> String {
        return "Hello World!!!!!"
    }
    
    func  downloadData2(completionHandler: (_ data: String) -> ()) {
        completionHandler("NEW DATA!!!!")
    }

    func  downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("NEW DATA!!!!")
        }
    }

    func  downloadData4(completionHandler: @escaping (DownloadResults) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResults(data: "NEW DATA!!!!")
            completionHandler(result)
        }
    }
    
    func  downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResults(data: "NEW DATA!!!!")
            completionHandler(result)
        }
    }
}

struct DownloadResults {
    let data: String
}


typealias DownloadCompletion = (DownloadResults) -> ()

struct EscapingClosuresBootCamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingClosuresBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingClosuresBootCamp()
    }
}
