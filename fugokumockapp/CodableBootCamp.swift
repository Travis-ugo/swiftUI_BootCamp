//
//  CodableBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 10/08/2023.
//

import SwiftUI

//struct CustomerModel: Identifiable, Decodable, Encodable {
//    let id: String
//    let name: String
//    let point: Int
//    let isPremium: Bool
//
//    init(id: String, name: String, point: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.point = point
//        self.isPremium = isPremium
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case point
//        case isPremium
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.point = try container.decode(Int.self, forKey: .point)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.id, forKey: .id)
//        try container.encode(self.name, forKey: .name)
//        try container.encode(self.point, forKey: .point)
//        try container.encode(self.isPremium, forKey: .isPremium)
//    }
//}

struct CustomerModel: Identifiable, Codable {
    let id: String
    let name: String
    let point: Int
    let isPremium: Bool
}

class CodableViewModel: ObservableObject {
    @Published var customer: CustomerModel? = nil
//    CustomerModel(id: "1", name: "Customer one", points: 2, ispremium: true)
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJsonData() else { return }
        
        do {
            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
        } catch let error {
            print("ERROR DECODEING \(error)")
        }
        
//        if
//            let localData = try? JSONSerialization.jsonObject(with: data),
//            let dictionary = localData as? [String: Any],
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let point = dictionary["point"] as? Int,
//            let isPremium = dictionary["isPremium"] as? Bool {
//            let newCustomer = CustomerModel(id: id, name: name, points: point, isPremium: isPremium)
//
//            customer = newCustomer
//        }
    }
    
    func getJsonData() -> Data? {
        
        let customers = CustomerModel(id: "11234567", name: "TWO Name", point: 16, isPremium: false)
        
        let jsonData = try? JSONEncoder().encode(customers)
        
//        let dictionary: [String: Any] = [
//            "id": "11234567",
//            "name": "One Name",
//            "point": 2,
//            "isPremium": true
//        ]
//        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary)
        return jsonData
    }
    
}

struct CodableBootCamp: View {
    
    @StateObject var vm = CodableViewModel()
    
    var body: some View {
        VStack (spacing: 20) {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.point)")
                Text("\(customer.isPremium.description)")
            }
            
        }
    }
}

struct CodableBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        CodableBootCamp()
    }
}
