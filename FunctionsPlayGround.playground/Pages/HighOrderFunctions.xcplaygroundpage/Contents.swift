//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

/*
 HigherOrderFunctions - this are special type of functions which work on collections to give us results with lesser code
 map, filter, sort, reduce, compactMap, Flatmap, foreach, zip
 */

// 1.Map - it works on collection and transform each element by given operation and results into a collection

let number = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let result = number.map { $0 * $0 }
print(result) 


let fruits = ["apple", "banana", "orange", "mango"]
let upperCasedFruits = fruits.map { $0.uppercased() }
print(upperCasedFruits)


struct Employee {
    var name: String
    var empId: Int
}
let employees:[Employee] = [
    Employee(name: "Ravi", empId: 1),
    Employee(name: "Shyam", empId: 2),
    Employee(name: "Suresh", empId: 3),
    Employee(name: "Meghna", empId: 4)
        
]
let names = employees.map{$0.empId > 2 ? $0.name : "No Name"}
print(names)



// 2. Filter used when you want to filter some data
let numbers1: [Int] = [1, 2, 3, 4, 5]
let evens = numbers1.filter { $0 % 2 != 0}
print(evens)

let empWhoNameEndsWithe = employees.filter {$0.name.last == "e"}
let onlyNames = empWhoNameEndsWithe.map{$0.name}
print(empWhoNameEndsWithe)
print(onlyNames)

let fruitWithA = fruits.filter {$0.first == "a"}

// 3. sort
let numsToBeSorted = [213,4,143,42134,43,31,34,312,34,123,434,5,676,7]

let sortedNums = numsToBeSorted.sorted()
print(sortedNums)

employees.sorted { $0.empId < $1.empId }.forEach { print($0.name) }

// 4. reduce - just gives on single value, it does not return collection unlike other HOF (High Order Function)

let sumOfAll = numbers1.reduce(0, +)
print(sumOfAll)


//5. flatMap - this flatens nested collection


let mixArray = [[1,2],[3],[4,5,6],[7,8]]
let flatArray = mixArray.flatMap {$0}
print(flatArray) // prints the entire array together


// 6. compactMap - it removes nil from collection
let arrayWithNil: [Int?] = [1,2,nil,3,nil,4]
let compactArray = arrayWithNil.compactMap {$0}
print(compactArray) // prints array without nils


//7. foreach is used alot with swiftUI

numsToBeSorted.forEach { print($0) } // print each element
