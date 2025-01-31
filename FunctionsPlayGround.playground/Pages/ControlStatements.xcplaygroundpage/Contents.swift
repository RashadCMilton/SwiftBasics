//: [Previous](@previous)

import Foundation


//1 If
// if condition {
// .....
//}
let temp = 26;
if temp > 25 {
    print("It is very hot!")
}

// if else

let age = 21;
if age >= 18 {
    print("Not an adult")
}
else {
    print("is an adult")
}

// else if

let speed = 60;
if speed > 60 {
    print("Slow Down! Too Fast Speed")
}
else if speed < 15 {
    print("Speed Up! Too Slow Speed")
}
else {
    print("You are driving perfect!")
}

// Switch Statements
func checkScore(score:Int) {
    switch score {
    case 0..<50:
        print("Its a poor score")
    case 50..<75:
        print("It is an Avg score")
    case 75..<90:
        print("It is an excellent score")
    case 90...100:
        print("its a top score")
    default:
        print("it invalid score")
    }
}
checkScore(score: 100)

// Usage of guard as a conditional statement
func checkAge(_ age: Int) {
    guard age > 18 else {
        print("Person is a minor")
        return
    }
    print("Person is Adult")
}
checkAge(10)



