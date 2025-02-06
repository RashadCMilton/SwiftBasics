//: [Previous](@previous)

import Foundation
//optionals - It gives us capability to create a variable whiich can have a value or could be nil
// Default value of optionals is NIL value

var name:String?
/*
 enum Optional<>
 */
name = "Shubham"
print("Name is \(name)")

var number:Int?
print(number ?? 0)

/*
 Optional Binding - getting a value out of optional variable in safe manner in optional binding
 1. if let
 2. guard let
 3. ?? - nil collecesing operator
 */
// 1. If let
name = nil
if let nameValue = name {
    print("Name value is \(nameValue)")
}

if let newNumber = number {
    print("newNumber is \(newNumber)")
}

// 2. guard let *Useful for early exit*
@MainActor func getValueForName(){
    guard let newName = name else { // if this is nil, will not execute logic outside of else scope
        print("There is no value for name")
        return
    }
    print("Value for newName is \(newName)")
}
getValueForName()
// guard let x = abc else {
    //return
//}
//
//3 ?? - nil collecesing operator
print(name ?? "Default Value")

name = "SwiftUI"
// 4. Force unwrapping
print(name!) // crashed when force unwrapping NIL value
