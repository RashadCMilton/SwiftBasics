//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
// 1. encapasulation
// 2. inheritance
// 3. polymorphism
// 4. abstraction

/* 1. Encapsulation - hiding data or restricting direct access to implmentation from outside
 (private, fileprivate, internal, public, and open)
 
 2. Inheritance - Inheriting properties and methods from another or parent class
 swift only supports only single level inheritance
 
 3. Polymorphism - having many forms, or mutiple implementations for same signature
 - we can achieve this usimg method overriding, protocol(interfaces)
 
 4. Abstraction - omission of unneccsary details, or exposing only required neccessary details to outside entities
 - This is achieve in IOS using protocols
 
 Class - A blueprint for object, it has methods, properties, and using object we can reuse the functionality
 
 Class are refrence types, they get stored on Heap Memory
 
 address table - data table
 *** Behind scene looks for address first then address has address for the data table
 This is why classes are a lil slower than structs
 */

// All of methods, properties inside of the object is encapsulation
class Human {
    // properties (Example of abstraction)
    fileprivate var name: String
    // fileprivate allow to access properties in same file
    fileprivate var address: String
    
    //initillizer
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
    
    // functions or methods
    // Self is not needed
    func walk() {
        print("Human \(self.name) is walking to his addresss which is \(self.address)")
    }
}
// h1 is now an instance of the class
let h1 = Human(name: "John", address: "123 Main St")
h1.walk()

let mike = Human(name:"Mike", address:"456 Elm St")
mike.walk()

class Student: Human {
    private var rollNo: Int
    
    init(rollNo: Int, name: String, address: String) {
        self.rollNo = rollNo
        super.init(name: name, address: address)
    }
    func studying(){
        print("\(self.name) is studying with rollNo \(self.rollNo)")
    }
    override func walk() {
        print("Student \(self.name) is walking to \(self.address)")
    }
}
let s1 = Student(rollNo: 1, name: "Frank", address: "123 Street St")

s1.studying()
s1.walk()

