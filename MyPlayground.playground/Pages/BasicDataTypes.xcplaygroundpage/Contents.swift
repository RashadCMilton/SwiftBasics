import UIKit

var greeting = "Hello, playground"

/* Multiline comment
 Data Types in Swict
 int = 3261262
 double = 7.0438973247
 float = 20.2 Less capabailities then float
 Bool = True or False
 Char = "a"
 */

// Single Comment
print("Hello World")

//Strings

var name = "This is my first statement" // Implicit Variable Declaration
print(name)
print("This is name - \(name)")

var addresss: String = "This is my address" // Explicit Variable Declaration
print(addresss)
print("This is address - \(addresss)")

// constant - let
let age: Int = 20 // Cannot be changed
print(age)
print("This is age -\(age)")
// age = age + 1  is an invalid statement because it is a let (an immutable variable)
name = "This is second statement" // Can be changed because it is var, not a let
print(name)

// var - variable
var score = 100
score = 110
print(score)

// int
let rollNo = 2 // int
print(rollNo)

let employeeID: Int = 101
print(employeeID)

var marks: Int // initialization without assigning value
marks = 80
print(marks)

// floats & doubles
var num:Float = 3.14
var db:Double = 3.1412621337123612937

// Bools only take T or F
// true and false are result keywords
var isValid:Bool = true
var isCorrect:Bool = false

// If you do not explicit declaration, chars are treated as strings
var singChar:Character = "a"
singChar = "b"
print(singChar)















