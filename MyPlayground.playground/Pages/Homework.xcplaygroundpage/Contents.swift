//: [Previous](@previous)

import Foundation

//var and constant assignment
var Integer: Int = 10;
print("The value of Integer is \(Integer)")
var string: String = "Hello World";
print("The value of String is \(string)")
var Float: Float = 3.14;
print("The value of Float is \(Float)")
var Double: Double = 3.14159;
print("The value of Double is \(Double)")
var Bool: Bool = true;
print("The value of Bool is \(Bool)")
let Character: Character = "z"
print("The value of Character is \(Character)")
let constantInteger: Int = Integer+4;
print("The value of constantInteger is \(constantInteger) \n")

// Array Operations
var array: [Any] = [Integer, constantInteger, Integer+2, Float, string, Bool, Double]
print("The value of array is \(array) \n")
array.append(10.5); array.append(false);  array.append("Hello World! Again");
print("The New Value of array is \(array) \n")

let newArray: [Int] = [100, 200, 300, 38,11, 1322,21312,123,23,2,3];
print("This is the array to be combined: \(newArray)\n")

// appends newArray to array
array.append(contentsOf: newArray)
print("The New Value of the combined array \(array)\n")

//Creating copies of array (array uses Copy on Write)
//var arrayCopy: [Any] = newArray;
//print("Array Copy is \(arrayCopy) and original array is \(array) \n");

// changing value in arrayCopy will not change values in original copy array
//array[array.count-1] = 20
//arrayCopy[0] = array[array.count-1]
//print("After inserting values, array copy is \(arrayCopy) and original array is \(array) \n");

// Set operations
var Set:Set = [Integer, Integer, Integer, 11, 12, 13, constantInteger, constantInteger+1, 0, 5]
print("The value of Set is \(Set)")
print("The sorted value of Set is \(Set.sorted()) \n")
var arr = Array(Set)
arr.append(Integer+15); arr.append(Integer+16); arr.append(Integer+17); Set.insert(Integer+18)

print("The intersection between the Set: \(Set) and the Array: \(arr) is \n \(Set.intersection(arr)) \n")

print("The difference between the Set: \(Set) and the Array: \(arr) is \n \(Set.subtracting(arr)) \n")

let randomIndex: Int = Int.random(in: 0..<arr.count)
print("It is \(Set.contains(arr[randomIndex])) that the Set (\(Set)) contains the element \(arr[randomIndex]) \n")

// dictionary operations
var dictionary: Dictionary<String, Any> = ["Integer": Integer, "constantInteger": constantInteger, "Integer+2": Integer+2, "Float": Float, "string": string, "Bool": Bool, "Double": Double]
print("This is the dictionary \(dictionary) \n")
dictionary["Integer+100"] = Integer+100
dictionary["Float+100"] = Float+100
dictionary["Double+100"] = Double+100
print("This is the new dictionary \(dictionary) \n")
print("This is a random element in the dictionary \(dictionary.randomElement()!) \n")

dictionary.removeValue(forKey: "Integer+2")
print("This is the updated dictionary \(dictionary) \n")

// clears all data from dictionary
dictionary.removeAll()
print("The dictionary is now empty: \(dictionary) \n")

