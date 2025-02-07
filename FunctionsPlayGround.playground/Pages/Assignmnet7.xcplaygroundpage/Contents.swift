//: [Previous](@previous)

import Foundation


class EmployeeManager{
    init (){
        print("Init for EmployeeManager")
    }
    func fire(name: String) {
        print("You have been fired:" )
        print(name)
    }
    deinit{
        print("Deinit for EmployeeManager")
    }
}
class ViewEmployee{
 
    let employeeManager: EmployeeManager;
    
    var name: String? // used for property injection
    
    
    // Best practice known as constructor injection
    init(employeeManager: EmployeeManager) {
        self.employeeManager = employeeManager
        print("Init for View Employee")
    }
    
    func sumbitResignation(){
        employeeManager.fire(name: self.name ?? "")
    }
    deinit {
        print("Deinit for VE")
    }
}

let e1 = ViewEmployee(employeeManager: EmployeeManager()) // This is constructor injection *This is Best*

e1.name = "Random Name"
e1.sumbitResignation()

//: [Previous](@previous)

/*
    Depedenacy Inversion - Injecting dependacy using prorocols
 */
protocol DatabaseManagerProtocol {
    func saveData()
}

extension DatabaseManagerProtocol {
    func deleteKey(securityKey: inout Int) {
        securityKey = 0;
    }
}

class DatabaseManager : DatabaseManagerProtocol {
    func saveData() {
        print("Data saved to database")
    }
}

class ViewDatabase {
    let databaseManager: DatabaseManagerProtocol
    //private
    var securityKey: Int
    init(databaseManager: DatabaseManagerProtocol) { // Constructor Injection using a protocol
        self.databaseManager = databaseManager
        self.securityKey = Int.random(in:10000...100000)
    }
    
    func fetchData() {
        databaseManager.saveData()
    }
    func key() {
        print(getSecurityKey())
    }
    
    private func getSecurityKey() -> Int {
        return securityKey;
    }
}

class SQLManager: DatabaseManagerProtocol {
    func saveData() {
        print("Data saved to SQL")
    }
    
}

let vc = ViewDatabase(databaseManager: SQLManager()) // can pass anything that conforms to protocol
let v1 = ViewDatabase(databaseManager: DatabaseManager())
vc.fetchData()
v1.fetchData()


//v1.getSecurityKey() //cannot access due to private
//v1.securityKey
v1.key()
//var securityKey = 26;
v1.databaseManager.deleteKey(securityKey: &v1.securityKey)
v1.key()

