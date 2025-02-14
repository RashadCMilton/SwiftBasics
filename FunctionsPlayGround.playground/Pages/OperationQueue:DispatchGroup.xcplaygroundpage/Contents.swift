import Foundation
/*
 Operation Queue - Its a wrapper framework, built on top of GCD but operation queue gives us more control like we can pause, resume, cancel, start the operation in a queue we can set dependacy among task using operation queue
 */


// Block Operation


let taskToPerform = BlockOperation {
    print("This is a block operation")
}
let oq = OperationQueue()
oq.addOperation(taskToPerform) // soon as added it is called

//oq.addOperations([taskToPerform], waitUntilFinished: false)  can give an array of task

let prepareLettuce = BlockOperation {
    print("Preparing lettuce")
}
let prepareCheese = BlockOperation {
    print("Preparing cheese")
}
let prepareBread = BlockOperation {
    print("Preparing bread")
}
let saladQueue = OperationQueue()
//saladQueue.addOperation(prepareLettuce)
//saladQueue.addOperation(prepareCheese)
//saladQueue.addOperation(prepareBread)

prepareBread.addDependency(prepareCheese) // bread wont start unitl cheese finisheds
prepareCheese.addDependency(prepareLettuce)
saladQueue.addOperations([prepareLettuce, prepareCheese, prepareBread], waitUntilFinished: false)


/*
  DispatchGroup = its part of GCD and it is used to manage group of tasks or operation to run once all the tasks are compiled it will notify the other thread
 */


let group = DispatchGroup()

group.enter()
print("Task 1")
group.leave()


group.enter()
print("Task 3")
group.leave()

group.enter()
print("Task 2")
group.leave()

group.notify(queue: .main) {
    print("Updating UI")
}
