//
//  CoreDataRelationshipBootCamp.swift
//  fugokumockapp
//
//  Created by Travis Okonicha on 05/08/2023.
//

import SwiftUI
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING \(error)")
            }
        }
        context = container.viewContext
    }
    
    func saveData() {
        
        do {
            try container.viewContext.save()
            print("save successful")
        } catch let error {
            print("ERROR CAUGHT \(error)")
        }
        
    }
    
}

class CoreDataRelationshipViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var businesses: [BusinessEntity] = []
    
    @Published var departments: [DepartmentEntity] = []
    
    @Published var employees: [EmployeeEntity] = []
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    // comman + option + left = fold up
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Microsoft"
        
        newBusiness.departments = [departments[0], departments[1]]
        
        newBusiness.employees = [employees[1]]
        save()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        do {
            businesses =  try manager.context.fetch(request)
        } catch let error {
            print("ERROR FETCHING \(error.localizedDescription)")
        }
    }
    
    func addDepartments() {
        
        let newDepartment = DepartmentEntity(context: manager.context)
        newDepartment.name = "Engineering"
//        newDepartment.businesses = [businesses[0]]
        
        newDepartment.addToEmployees([employees[1]])
        
        save()
        
    }
    
    func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do {
            departments =  try manager.context.fetch(request)
        } catch let error {
            print("ERROR FETCHING \(error.localizedDescription)")
        }
    }
    
    func addEmployee() {
        let newEmployee = EmployeeEntity(context: manager.context)
        newEmployee.name = "Mercy"
        newEmployee.age = 16
        newEmployee.dateJoined = Date()
        
//        newEmployee.business = businesses[0]
//        newEmployee.department = departments[0]
        
        save()
    }
    
    func getEmployees() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        do {
            employees =  try manager.context.fetch(request)
        } catch let error {
            print("ERROR FETCHING \(error.localizedDescription)")
        }
    }
    
    
    func save() {
        businesses.removeAll()
        departments.removeAll()
        employees.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            
            self.manager.saveData()
            self.getBusinesses()
            self.getDepartments()
            self.getEmployees()
        })
        
    }

}

struct CoreDataRelationshipBootCamp: View {
    
    @StateObject var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Button (action: {
                        vm.addBusiness()
                    }, label: {
                        Text("Perfrom Action")
                            .foregroundColor(Color.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                        
                    })
                    Text("Power")
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.businesses) { business in
                                BusinessView(entity: business)
                            }
                        }
                    })
                    
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.departments) { department in
                                DepartmentView(entity: department)
                            }
                        }
                    })
                    
                    
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.employees) { employee in
                              EmpoyeeView(entity: employee)
                            }
                        }
                    })
                    
                  
                    
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    
    }
}

struct CoreDataRelationshipBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataRelationshipBootCamp()
    }
}


struct BusinessView: View {
    
    let entity: BusinessEntity
    
    var body: some View {
        VStack( alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments")
                    .bold()
                
                ForEach(departments) { department in
                    Text(department.name ?? "")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees")
                    .bold()
                
                ForEach(employees) { employee in
                    VStack {
                        Text(employee.name ?? "")
                        Text("\(employee.age)")
//                        Text(employee.dateJoined ?? "")
                    }
                    
                }
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color.gray.brightness(0.3).cornerRadius(10))
//        .shadow(radius: 10)
    }
}



struct DepartmentView: View {
    
    let entity: DepartmentEntity
    
    var body: some View {
        VStack( alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let businesses = entity.businesses?.allObjects as? [BusinessEntity] {
                Text("Businesses")
                    .bold()
                
                ForEach(businesses) { business in
                    Text(business.name ?? "")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees")
                    .bold()
                
                ForEach(employees) { employee in
                    VStack {
                        Text(employee.name ?? "")
                        Text("\(employee.age)")
//                        Text(employee.dateJoined ?? "")
                    }
                    
                }
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .foregroundColor(Color.white)
        .background(Color.green.cornerRadius(10))
//        .shadow(radius: 10)
    }
}



struct EmpoyeeView: View {
    
    let entity: EmployeeEntity
    
    var body: some View {
        VStack( alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            Text("Age: \(entity.age)")
            Text("Date Joined: \(entity.dateJoined ?? Date())")
            
            Text("Businesses")
                .bold()

            Text(entity.business?.name ?? "")
            
            Text("Department")
                .bold()
            
            Text(entity.department?.name ?? "")
        }
        .padding()
        .frame(maxWidth: 300)
        .foregroundColor(Color.white)
        .background(Color.blue.cornerRadius(10))
//        .shadow(radius: 10)
    }
}
