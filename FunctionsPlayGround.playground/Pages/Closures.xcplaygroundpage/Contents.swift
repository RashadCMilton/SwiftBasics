//: [Previous](@previous)
// Very important for interviews
import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/*
 Closures - is unnamed block of code which you can assign to a variable ot you cann pass as a paramater to a function or return from a function as well
 */
//let closure = () -> ()

func sayHello() {
    print("Hello Everyone")
}
sayHello()

// Assigning closure to variable
let sayHelloClosure = {
    print(greeting)
}
// call the block of code by adding paratheses to var name
sayHelloClosure()

// you can pass closure into function "() -> ReturnType"
func greetPeople(wishThem: () -> Void){
    print("we are in closure function")
    wishThem()
}

// Three ways to pass a closure as a paramater
greetPeople(wishThem: sayHelloClosure)

greetPeople(wishThem: {print("Hi1");
    print("Everyone2"); print("How are you3");})

greetPeople{
    print("Hi4")
    print("Everyone5")
    print("How are you6")
}

func doAddition(num1:Int, num2:Int, completion:(Int) -> Void) {
    let sum = num1 + num2
    completion(sum)
}

doAddition(num1: 5, num2: 25) { result in print("The sum is: \(result)")
}

/*
 1. Non escaping closure (Default Type of closure)
 2. Escaping closure
 
 // Based on syntax
 3. Trailing closure
 4. Auto closure
 */

// 1. Non escaping closure - this closure finishes it working before end of function. This closure does not outlive the scope of function

func nonEscapingClosure(completion: () -> Void) {
    print("Start Of Non-Escaping Closure")
    completion()
    print("End Of Non-Escaping Closure")
}
nonEscapingClosure {
    print(greeting)
    print("Non-Escaping Closure")
}
// 2. Escaping closures - a closure which outlives the scope of the function, and which gets evaluated somme time in future. This escaping closures are usually used for async programming, like API/WebService calls

func escapingClosure(url:String, completion:@escaping () -> Void) {
        print("Start of Escaping Closure")
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        completion()
    }
    print("end of my function")
}
escapingClosure(url: "https://www.google.com") {
    print("API call started")
    print("API call in progress")
    print("API call completed")
}

// 3.Trailing closure - when a closure is the last param to a function, then it get called as trailing closure

func doSubtraction(n1:Int, n2:Int, completionHandler:(Int) -> Void) {
    let sub = n1-n2;
    completionHandler(sub)
}
doSubtraction(n1: 200, n2: 50) { res in print("Result is: \(res)")
}

// 4. Auto Closures - so when a closure gets automatically wrapped in a block of code, and which does not accept any parameters and does not return anything, then it is an auto closure

func greet(msg:String, wish:()->Void) {
    print("Inside AutoClosure func")
    wish();
}
greet(msg: "Good Morning") {
    print("Hey! this is an auto closure!")
}
