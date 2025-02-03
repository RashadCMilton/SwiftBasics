//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/*
 Protocol- its a blueprint for a set of functions or properties, which needs to be implemented when protocol is confirmed on class or enum
 Protocol does not have implementation declaration, functions, and properties
 Protocols does not have there own memeory storage
 It is basically signature of methods defined in a body of scope
 **Called Interface in Java, C#
 */

protocol MyProtocol {
    func doSomeTask()
    func doAnotherTask()
}

class MyClass: MyProtocol {
    func doSomeTask() {
        print("some task")
    }
    func doAnotherTask() {
        print("doAnotherTask")
    }
}
let c1 = MyClass()
c1.doSomeTask()
c1.doAnotherTask()

// cannot have stored propeties in protocol since no memory therefore no stack to save properties, **Only Computed Properties**
// Can have as many protocol as you want, not like classes with Inheritance
// typealias can combine protocol, known as protocl compostion
// everything is based in protocol
// POP = Protovol Oriented Programming
//we rely more on usage of protocols than inheritance

typealias Codeable = Encodable & Decodable

protocol Driving{
    
    mutating func accelerate(speed:Double)
    var speed:Double{get set}
}
// Use extension to make methods optional in a protocol
extension Driving{
    func applyBreaks() {
        print("applying breaks!")
    }
}
class Vehicle:Driving{
    var speed: Double = 0.0
    
   
    func accelerate(speed:Double) {
        print("accelerate by : \(speed)")
    }
}
let v1 = Vehicle()
v1.accelerate(speed: 17.7)
v1.applyBreaks()


struct Truck: Driving {
    var speed: Double = 10
    func applyBreaks() {
        print("Applying Breaks!")
    }
    mutating func accelerate(speed:Double) {
        self.speed = self.speed + speed
        print("accelerate by : \(speed)")
    }
}
var t1 = Truck(speed: 10)
t1.accelerate(speed: 20.2)
t1.applyBreaks()






