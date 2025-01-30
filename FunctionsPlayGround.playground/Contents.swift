import UIKit

var greeting = "Hello, playground"
func displayData() {
    print("Printing data")
}
displayData()
//function that accepts data

func displayNames(name:String, postcode: Int) {
    print("Details are name = \(name) and postcode is \(postcode)")
}

displayNames(name: "Mike", postcode: 202)


func doAddition(num1: Int, num2: Int) -> Int {
    let sum = num1 + num2
    return sum
}
doAddition(num1: 2, num2: 2)

func doSquare(number: Int) -> Int {
    let square = number * number
    return square
}
let result = doSquare(number: 5)

print("The result is \(result)")

func makeSquare(num: inout Int) {
    
    num = num * num
}
var myNum = 3
makeSquare(num: &myNum)
print("The value of myNum is \(myNum)")
