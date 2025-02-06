//: [Previous](@previous)

import Foundation

/*
 Associated Type - It is used for protocol to define a placeholder for the type that is used as a part of protocol
 This is similar to Generics and apart of the same family
 */


protocol Shape{
    associatedtype Area // can inherit Numeric protocol etc, Placeholder to be implemented when using protocol
    mutating func calculatingArea() -> Area
}

struct Square:Shape{
    var side: Double = 0
    typealias Area = Double // assign associated type with typealias
    mutating func calculatingArea() -> Area {
        return side * side
    }
}

var s1 = Square(side: 4)
print("Area for Square is \(s1.calculatingArea())")

struct Rectangle:Shape {
    var length: Int = 0
    var width: Int = 0
    typealias Area = Int // assign associate type
    mutating func calculatingArea() -> Int {
        return 2 * length + 2 * width
    }
}
var r1 = Rectangle(length: 10, width: 10)
print("Area for Rectangle is \(r1.calculatingArea())")

struct Polygon: Shape {
    var side:Int = 0
    typealias Area = String
    
    mutating func calculatingArea() -> String {
        return "Polygon Calculated Area"
    }
}
