//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// COPY On Write(COW) - its a memory optimization technique by swift, whcih works for value types. Until you modified a copied element refera to sma memory location
//This way it saves memory footprint, and avoid unneccsary memory allocation

var array1 = [1, 2, 3, 4, 5, 6]  // 0X1000
var array2 = array1  // 0X1000 (Keeps memory location same until data is changed
array2[0] = 10  // 0X2000
array1.append(50)  //[1,2,3,4,5,6,50]

array2  // [10,2,3,4,5,6]
var a = "swift"  // memory location 1111
var b = a  // different memory location 12222

/* Memory Types
 1. Stack Memory - (LIFO) last in first out
 This is used for all value types - structs, strings, Int, all datat types, enum, dictionary, sets
 this is also used for storing local variables or parameters to function or return types

 data allocated on stack memory is automatically deallocated when usage is done, this happen by compiler itself

 Stack memory is automatically deallocated by compiler, no need for garbage collections

 Stack memory is typically fixed memory size

 2. Heap Memory - Classes, Closures, Actors
 This memory is allocated at run time
 Objects like views, array of objects, complicated data will be saved in heap memory

 Only for heap memory we need to worry about memory management

ARC - Automatic Refrence Counting // similar like garbage collection in other languages like Java

 *3 Types of refrences*
 strong
 weak
 unowned

 */

// Uses stack memory
func doSum(n1: Int, n2: Int) -> Int {
    let sum = n1 + n2
    return sum
}
let op = doSum(n1: 3, n2: 3)

// Uses heap memory
class Person {
    var name: String

    init(name: String) {
        self.name = name
        print("Init for Person Class \(self.name)")
    }
    
    deinit{
        print("Deinit for Person Class \(self.name)")
    }
}
class Car {
    weak var owner: Person?
}
// 0 ARC count is zer0
var p: Person? = Person(name: "John") // 1 Arc count now
p = nil // 0 ARC count when it becomes zero compiler know that it need to free memory from this object
// strong(default attribute) - increments the retain count, you have the responsibilty to set it nil
var p1:Person? = Person(name: "Steve") //ARC 0 + 1 = 1
var p2 = p1 // 1 + 1 = 2

p2 = nil; //  2 - 1 = 1
p1 = nil; // 1 - 1 = 0 compilers free memory here. Only When 0!!!!





// weak - does not increement retain ARC count, weak is optional
var p3:Person? = Person(name: "Weak") // will not increment counter

var car: Car = Car()

car.owner = p3
p1 = nil


// unowned - this is same like weak, it does not increment the retain count, but cannot be unwrapper, if unowned is nil will crash code
// Only use unowned if you know 100% the value will not be nil
// you will ratherly use unowned
//unowned var p4:Person? = Person(name: "Unowned")


// Memory management for closures
class Employee{
    var name: String
    var doSomeTask: (() -> Void)?
    init(name: String) {
        self.name = name
    }
    // [weak self] allows for ARC count to not increment in closures
    // known as capture list ([weak self])
    func doInitialSetup(){
        doSomeTask = { [weak self] in
            print("Doing some task for \(self?.name)")
        }
    }
    deinit {
        print("Denit for Employee")
    }
    
}

var emp1:Employee? = Employee(name: "Him") // 1
emp1?.doInitialSetup()
emp1?.doSomeTask?() // 1+1
emp1 = nil; // 2-1



var counter = 1
// Capture list will capture previous value and retain it
let update = { [counter] in
    print("Current Value is \(counter)")
}
update()
counter = 5;
update()
// capture list - this is used in closure to explicity specify how the values from the enclosing scope should be captured

