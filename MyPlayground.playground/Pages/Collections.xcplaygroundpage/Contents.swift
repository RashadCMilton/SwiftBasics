//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/*
 Collections in IOS
 1. Array
 2. Set
 3. Dictionary
 */

//1.Array ordered collection of similar data types
var numbers:[Int] = [1,2,3,4,5,6,7,8,9,10]
numbers.append(11) // appends to end of array
print("the values in array numbers \(numbers)")

let firstValue = numbers[0]
print("The first value of the array:\(firstValue)")

let intialValue = numbers.first
print(intialValue)

let lastValue = numbers.last
print(lastValue)

let middleElement = numbers[numbers.count/2]

var stringArray = [String]()
stringArray = ["abc","bed","cad","dad","eat"]
print("The string array: \(stringArray)")

var weekDays: [String] = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
print("Week days are \(weekDays)")

weekDays.append("Sunday")
print("Week days are \(weekDays)")
print("Number of elements in array: \(weekDays.count)")

var mixedArray: [Any] = [1,2,"three",true] //use keyword Any for mixed data types in array
print("Mixed array: \(mixedArray)")

//2.Set Unique unordered collection of data types, that do not allow duplicates
var studentId:Set = [1,2,3,4,5,5,5,5,6,6,7]
studentId.insert(9)
studentId.insert(9)
studentId.insert(9)
studentId.insert(9)
studentId.insert(9)
studentId.remove(5)
print("No duplicates in studentID set \(studentId)")

var stringSet:Set<String> = ["apple","banana","cherry","apple","banana"]
print("No duplicates in string set:\(stringSet)")

//3.Dictionary - collections of key values
//Dictionary only allows uniques keys, can have duplicate values
var myDictionary = ["a":1, "b":2, "c":3]
print(myDictionary["b"])
myDictionary["a"] = 100
print(myDictionary["a"])
print("The dictionary: \(myDictionary)")




