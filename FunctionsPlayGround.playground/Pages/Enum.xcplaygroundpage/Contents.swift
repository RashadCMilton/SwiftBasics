//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/*
 Enum - Its a group of related data types, value types
 Enum has cases, and it is a value type
 Uses case keyword
 We typicallly use enum in Switch statements
 Do not need to create object, can directly access the value
 
 Enum has 2 types
 1. raw value enum
 2. associatedtype enum
 */

// 1. Raw value enum
enum CarBrand:String {
    case Honda = "Known for build quality"
    case Tesla = "Known for status"
    case Mercedes = "Known for luxury"
    case BMW = "Known for performance"
    
}
print(CarBrand.Honda.rawValue)

func getCarWorth(carBrand:CarBrand) -> String {
    switch carBrand {
    case .Honda:
        return "Honda cars are known for amazing quality"
    case .Tesla:
        return "Tesla cars are known for their status"
    case .Mercedes:
        return "Mercedes cars are know for their luxury"
    case .BMW:
        return "BMW cars are known for performance"
    }
}
let car = getCarWorth(carBrand: CarBrand.Honda)
print(car)

// 2. AssociatedType Enum (Similar but a little different)
/*
 Each case can have different value types encapsualted in an entity (CarPrice)
 If a case is not implemented, it will go to default
 */
enum CarPrice{
    case highEnd(price: Int)
    case midRange(price: Double)
    case lowRange(price: String)
}
func getCarPrices(for modelType:CarPrice) {
    switch modelType {
    case .highEnd(let price):
        print("This is high end car with price \(price)")
    case .lowRange(let price):
        print("This is low range car with price \(price)")
    default:
        print("Not buying a car")
        
    }
}

getCarPrices(for: .highEnd(price: 100000))
getCarPrices(for: .midRange(price: 173872.12))
getCarPrices(for: .lowRange(price: "I don't know"))

enum Weekdays: CaseIterable{
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    var dayType: String {
        self == .sunday || self == .saturday ? "Weekend" : "Weekday"
        // ? : Terenary operation short form for if else
    }
    func isItAHoliday() -> Bool {
        if self == .sunday || self == .saturday {
            return true
        }
        return false
    }
}
print(Weekdays.sunday.dayType)
print(Weekdays.sunday.isItAHoliday())


