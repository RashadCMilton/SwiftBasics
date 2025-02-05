//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
// 1. Default Initilzer - Can have mutiple initilizers
class Student{
    var name:String
    var rollNo:Int
    var age: Int?
    init(name: String, rollNo: Int) {
        self.name = name
        self.rollNo = rollNo
    }
    init(name: String, rollNo: Int, age: Int) {
        self.name = name
        self.rollNo = rollNo
        self.age = age
    }
}
let s1 = Student(name: "John", rollNo: 1)
let s2 = Student(name: "Mark", rollNo: 2, age: 20)

//2.Memberwise Initilze - only applicable to structs

struct PreKStudent{
    var name:String
    var rollNo:Int?
}

let kid = PreKStudent(name: "John", rollNo: 1)


//3. Convience Initlizer

class Language{
    var name: String
    var noOfYears: Int
    
    init(name: String, noOfYears: Int) {
        self.name = name
        self.noOfYears = noOfYears
    }
    convenience init(name: String) {
        self.init(name: name, noOfYears: 0)
    }
}
let python = Language(name: "Python")
let swift = Language(name: "Swift", noOfYears: 10)

// 4 failable initilzer - This give us capability to return nil when certain condition is not met

class Course{
    var subjectName: String
    var compulsorySubject: Int
    
    init?(subjectName: String, compulsorySubject: Int){
        if compulsorySubject < 5 {
            return nil
        }
        
        self.subjectName = subjectName
        self.compulsorySubject = compulsorySubject
    }
}


let math = Course(subjectName: "Math", compulsorySubject: 4)
let computerScience = Course(subjectName: "Computer Science", compulsorySubject: 10)


// 5. Required Init - making compulsion in subclass to have at least 1 init that will satisfy parent class initlization





















