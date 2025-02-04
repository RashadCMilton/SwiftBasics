//: [Previous](@previous)

import Foundation

/*
 Generics - This allows us to write code which works for any data type. By defining a placeholder that can contain any data type instead of a specfic one
 */


func displayData<T>(_ value: T) {
    print("display data \(value)")
}
displayData(10)
displayData(10.5)
displayData("Hello World")

func swapTwoNumbers<T>(a: inout T, b: inout T){
    let temp = a;
    a = b;
    b = temp;
}
var x = 3;
var y = 5
print("Before swap \(x) \(y)")
swapTwoNumbers(a: &x, b: &y)
print("After swap \(x) \(y)")

class Information<T>{
    var data: T
    init(data: T) {
        self.data = data
    }
    func setData(_ newData: T){
        data = newData
    }
    func displayData() {
        print("Current information is \(data)")
    }
}

let info = Information(data: "Hello World")
let info2 = Information(data: 10)

info.displayData()
// Can use protocols in functions (Numeric)
func doSum<T : Numeric>(a: T, b: T) -> T {
    return a + b;
}
let res = doSum(a: 123312, b: 12312.32)
print(res)


//generic struct
//FIFO
struct Queue<T> {
    private var items:[T] = [T]()
    
    mutating func push(_ element: T) {
        items.append(element)
    }
    mutating func pop() {
        items.removeFirst()
    }
    func isQueueEmpty() -> Bool{
        return items.isEmpty
    }
    func printMyQueue(){
        print("Elemenets from queue are : \(items)")
    }
}
var inQueue = Queue<Int>()
inQueue.push(1)
inQueue.push(2)
inQueue.push(3)
inQueue.printMyQueue()
