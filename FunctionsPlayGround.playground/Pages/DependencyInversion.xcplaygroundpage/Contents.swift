//: [Previous](@previous)

import Foundation

/*
    Depedenacy Inversion - Injecting dependacy using prorocols
 1. Constructor Injection / Initilzer Injection
 2. Property Injection
 3. Method Injection
 */
protocol DatabaseManagerProtocol {
    func saveData()
}
class DatabaseManager : DatabaseManagerProtocol {
    func saveData() {
        print("Data saved to database")
    }
}
class ViewController {
    let databaseManager: DatabaseManagerProtocol
    
    init(databaseManager: DatabaseManagerProtocol) { // Constructor Injection using a protocol
        self.databaseManager = databaseManager 
    }
    
    func fetchData() {
        databaseManager.saveData()
    }
}
class FireBaseManager: DatabaseManagerProtocol {
    func saveData() {
        print("Data saved to firebase")
    }
}

let vc = ViewController(databaseManager: FireBaseManager()) // can pass anything that conforms to protocol
let v1 = ViewController(databaseManager: DatabaseManager())
vc.fetchData()
v1.fetchData()


