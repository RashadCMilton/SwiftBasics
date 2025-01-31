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

let myTuples: (Int, String) = (2014, "Swift")
print(myTuples)
print(myTuples.0)
print(myTuples.1)

func doAllMathOperation(num1: Int, num2: Int) -> (Int, Int, Int, Float) {
    let sum = num1 + num2
    let difference = num1 - num2
    let product = num1 * num2
    let quotient: Float = Float(num1) / Float(num2)
    return (sum, difference, product, quotient)
}

let resultMathOperation = doAllMathOperation(num1: 10, num2: 20)
print((resultMathOperation))
print("Difference is \(resultMathOperation.1)")
print("Product is \(resultMathOperation.2)")
print("Quotient is \(resultMathOperation.3)")

func doNetworkWebServiceCall(url: String) -> (String, Bool, Int) {
    return ("recieved data", true, 200)
}
let webServiceResult = doNetworkWebServiceCall(url: "https://www.google.com")
print(webServiceResult)


