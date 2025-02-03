//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/*
 extension - It means adding new functionality or behavior to already existing things, to classes, struct, or data types
 */

let num = 5;
// Extended the INT functionailty through extension
extension Int {
    func square() -> Int {
        let sq = self * self;
        return sq
    }
}
print(num)
print(num.square())
// this also valid
print(2.square())

extension String {
    func makeITCapital() -> String {
        return self.uppercased()
    }
}
print("abcd".makeITCapital())

class Temperature {
    var celsius: Double = 0.0
    
    func setTemp(newValue: Double) {
        self.celsius = newValue
        print("Current temp is \(self.celsius)")
    }
}
let t1 = Temperature()
t1.setTemp(newValue: 25.0)

extension Temperature{
    func convertIntoFahrenheit() -> Double {
        let fahrenheit = (self.celsius * 1.8 + 32.0)
        print(fahrenheit)
        return fahrenheit
    }
}
t1.convertIntoFahrenheit( )
// Open Close principle = your entity should be open for extensin but close for modification

