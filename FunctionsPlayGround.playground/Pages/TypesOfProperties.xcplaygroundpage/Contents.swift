//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/*
     1. Stored Properties
     2. Computed Properties
     3. Lazy Property
     */
class Student{
    
    var name: String // Stored Property
    var age: Int
    //2. Computed property
    var marks:Int{
        print("Calculate marks")
        return 1000/age
    }
    
    // 3. Lazy property
    lazy var leaves:Int = { // lazy property delays the initilization process until you call the property once, it does only first time
        print("Calculate Leaves")
        return 25 - age
    }()
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}
let s1 = Student(name: "John", age: 20)
print(s1.marks)

print(s1.leaves)
print(s1.leaves)
