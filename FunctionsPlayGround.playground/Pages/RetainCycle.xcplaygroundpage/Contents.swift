//: [Previous](@previous)

import Foundation


/*
 RetainCycle - when two are more objects hold a strong refrences to each other, causing them to be retained in memory indefinity
 this will lead to memory leak issue and will impact the performance of app
 even though objects are no longer needed, the object wont be deallocated
 */
// Person holds Car object
// use weak for the least important class
class Person {
    var name: String
    var car:Car?
    // weak var car: Car? -> breaks Retain cycle and allows deinit to be called
    init(name: String, car: Car? = nil) {
        self.name = name
        print("Init for Person: \(name)")
    }
    deinit {
        print("Deinit for Person: \(name)")
    }
}
// Car holds a person object
class Car {
    var owner: Person?
    init() {
        print("Init for Car")
    }
    deinit {
            print("Deinit for Car")
    }
}
var p1: Person? = Person(name: "John")
var c1: Car? = Car()

p1?.car = c1
c1?.owner = p1


p1 = nil
c1 = nil; // No denit is being called since strongly dependent on each other

