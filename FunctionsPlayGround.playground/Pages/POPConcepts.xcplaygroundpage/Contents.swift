//: [Previous](@previous)

import Foundation
/*
    POP - Protocol Oriented Programming
 
- Pop promotes use of protocols and protocol extension to provide default implemantation and behavior over inheritance of classes
 
 -POP encourages composition using multiple protocols rather class inheritance
 
 - POP align well with Swifts emphasis on value types such as stucts, enums
 
 - Protocols can inherite multiple protocols at same time
 
 - we achieve highly modular composable code that is easy to maintain, loosly couple, extend, and test
 */

// 1. default implemenation and behavior

protocol Greetable {
    func wishPeople()
}
// extension allows you to add default implementation
extension Greetable {
    func wishPeople() {
        print("Good Morning, Have a nice day!")
    }
}

struct Person: Greetable {
    func wishPeople() {
            print("Hello Everyone from Person")
    }
}

struct Robo: Greetable {
    
}
let p1 = Person()
p1.wishPeople() // struct method called

let r1 = Robo()
r1.wishPeople() // extension method called

// 2. Multiple Protocol Conformance
protocol Flyable {
    func fly()
}

protocol Walkable{
    func walking()
}
struct Duck: Flyable, Walkable { // no limit to amount of protcols to conform
    func fly() {
        print("I can fly")
    }
    
    func walking() {
        print("I can walk")
    }
}
let duck = Duck()
duck.fly()
duck.walking()


// 3. Protocol with associated Types
protocol Stackable {
    associatedtype Element
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
}

struct Stack<T>: Stackable {
    typealias Element = T
    private var items: [T] = []
    mutating func push(_ element: T) {
        items.append(element)
    }
    
    mutating func pop() -> T? {
        return items.popLast()
    }
    func displayStack() {
        print(items)
    }
}

var numberStack = Stack<Any>()
numberStack.push(1)
numberStack.push("10")
numberStack.push(true)
numberStack.push(10.5)
numberStack.displayStack()
numberStack.pop()
numberStack.displayStack()

// 4. Protocol for DI (dependency injection)

protocol Logger{
    func log(msg: String)
}
struct ConsoleLogger: Logger {
    func log(msg: String) {
        print("Console: \(msg)")
    }
}
class App {
    let logger: Logger
    init(logger: Logger) {
        self.logger = logger
    }
    func displayLogs() {
        self.logger.log(msg: "Hello World")
    }
}
let app = App(logger: ConsoleLogger())
app.displayLogs()

struct FileLogger: Logger {
    func log(msg: String) {
        print("File: \(msg)")
    }
}

let app1 = App(logger: FileLogger())
app1.displayLogs()

// 5. protocol inheritance

protocol Vehicle{
    func drive()
}
protocol Servicing{
    func doRepair()
}
protocol FourWheeler: Vehicle, Servicing{
    func park()
}

struct Honda: FourWheeler{
    func doRepair() {
        print("Honda is repairing")
    }
    
    func park() {
        print("Honda is parked")
    }
    
    func drive() {
        print("Honda is in drive mode")
    }
}
let honda = Honda()
honda.park()
honda.drive()
honda.doRepair()






