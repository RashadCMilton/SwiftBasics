//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


/*
 Struct - Its value type similar like classes but does not support inheritance and inmutable by default
 struct - DO NOT need initializer, they come with inbuilt memberwise by default
 Value types get stored in StackMemory
 mutating keyword allow for changing struct data. (it is immutable bc stored on Stack)
 */
struct Employee {
    var name: String
    var dept: String
    var subject: Subject?
    
    
    func work() {
            print("\(name) is working in \(dept)")
    }
    mutating func updateDept(_ newDept: String) {
        dept = newDept
    }
}
struct Subject {
    var name: String
}
var emp1: Employee? = Employee(name: "Ravi", dept: "IT")

// Optional chaining allow code not to crash in presence of nil values
