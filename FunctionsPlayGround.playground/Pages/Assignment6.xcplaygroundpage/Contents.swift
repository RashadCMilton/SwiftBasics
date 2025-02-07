import Foundation

class Building {
   // var doors: Door?
    weak var doors: Door?
    init() {
        
        print( "Initialized Building with \(self)")
    }
    deinit {
        print( "DeInitialized Building with \(self)")
    }
}
class Door {
    var color: String
    var building: Building?
    init(color: String) {
        self.color = color
        print( "Initialized Door \(color)")
    }
    deinit{
        print("DeInitialized Door \(color)")
    }
}
var doors: Door?  = Door(color: "red")
var Mansion: Building? = Building()
Mansion?.doors = doors
doors?.building = Mansion
Mansion = nil
doors = nil

print()
class Closures {
    var taskToBeDone: (() -> Void)?
    init(){
        print("Initialized Closures")
    }
    func closureFunc() {
        taskToBeDone = { [weak self] in
       //[unowned self] in
            print("Weak Self Function called \(String(describing: self))")
        }
    }
    deinit{
        print( "DeInitialized Closures")
    }
}

var testClosure:Closures? = Closures()
testClosure?.closureFunc()
testClosure?.taskToBeDone?()
testClosure = nil
print()
var firstArray = Array(repeating: 0, count: 100)
firstArray.withUnsafeBufferPointer() { ptr in
    print("firstArray address:\n\(ptr.baseAddress ?? nil)")
}

var secondArray = firstArray
secondArray.withUnsafeBufferPointer() { ptr in
    print("secondArray address:\n\(ptr.baseAddress ?? nil)")
}

secondArray.append(6)
secondArray.withUnsafeBufferPointer() { ptr in
    print("secondArray address:\n\(ptr.baseAddress ?? nil)")
}
firstArray.withUnsafeBufferPointer() { ptr in
    print("firstArray address:\n\(ptr.baseAddress ?? nil)")
}
print()

protocol Task {
    associatedtype Result
    func execute() -> Result
}
struct Fetchdata: Task {
    typealias Result = Int
    func execute() -> Int {
        return Int.random(in: 0..<1000)
    }
}
struct ProcessData: Task {
    typealias Result = String
    func execute() -> String {
        return "Proccessed data"
    }
}
struct SaveData: Task {
    typealias Result = Bool
    func execute() -> Bool {
        return Result.random()
    }
}
// Tried to do type erasure but gave up
//struct AnyTask: Task{
//    private let _execute: () -> Any
//
//    init<T: Task>(_ task: T)  {
//        self._execute = {
//            return task.execute() as Any
//        }
//    }
//    func execute() -> Any {
//        return _execute()
//    }
//}
//class Workflow {
//    private var tasks: [AnyTask] = []
//    func addTask<T: Task>(_ task: T) {
//        tasks.append(AnyTask(task))
//    }
//    func execute() {
//        tasks.forEach { task in
//            let result = task.execute()
//            print("Task result: \(result)")
//
//        }
//    }
//}
let fetchDataTask = Fetchdata()
let processDataTask = ProcessData()
let saveDataTask = SaveData()

print(fetchDataTask.execute(), processDataTask.execute(), saveDataTask.execute())

