import Foundation
import UIKit
/*
 Multithreading - Doing multiple tasks at same time
 1. GCD - Grand Central Dispatch
 2. Operation Queue
 3. Async Await (Swift Concurrency, from swift 5.5 from IOS19)
 4. Thread/NSThread // Older Projects
 5. DispatchGroups
 6. Seamaphores
 7. DispacthBarrier
 8. Tasks
 9. Actor (Swift Concurrency, from swift 5.5 from IOS19)
 */

// Thread - a single sequential flow of control within your program
let thread = Thread {
    print("Hello world")
}
thread.start()




/*
 GCD - Grand Central Dispath
 FIFO - First In First Out
 Internally it uses threads as basic building bloc)k
 
 Tasks are added in a queue and then GCD picks the oldest task and execute it first and then once completion it goes to next task
 
 GCD is low level API for async operations
 with GCD we do not need to deal wiith complexities of thread management
 
 3 Types of Queues in GCD
 
 a. Main Queue - (anything related to UI should use main queue)
 b. Serial Queue (custom queue) - this are for us to create our own queue
 c. Global Queue - this are concurrent queues given by OS and are shared by system
 */
DispatchQueue.main.async {
    print("This code will get executed on main thread")
}
/*
    a. Main Queue - anything related to UI we should use Main Queue
    updating UI Elements
    loading images on UI asycnronously
    animating views
    handling notifications
    Coredata fetching
 */

// fetching data and then updating UI
DispatchQueue.main.async {
        // perorm on main thread
        // tableView.ReloadData()
    print("refreshing UI on Main thread")
    
}
// updating UIelements
DispatchQueue.main.async {
//    self.label.text = "Welcome to Swift"
//    self.view.backgroundColor = .systemBlue
}
//Error
//func loadImageFromUrl(_ url:URL) {
//    DispatchQueue.global().async {
//        if let data = data(contentsOf: url), let image = UImage(data:data) {
//            DispatchQueue.main.async { // should be done in main because dealing with UI
//              //  self.imageView.image = image
//            }
//        }
//    }
//}

// Animation or Animating views
// Error
//DispatchQueue.main.async{
//    UIView.animate(withDuration: 1) {
//        self.view.alpha = 0.5
//    }
//}

// execute any ui related task but with certain delay
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    print("Doing task after 3 seconds")
}

/* b. Serial Queue (Custom queues) - this are focus to create our own queue
 // This excutes only one task at a time in the order they are added
 
 */

let myQueue = DispatchQueue(label: "com.ba.AccessSpeciferPrj.myQueue")
// add tasks to the serial queue
myQueue.async {
    print("Task 1 Started")
    print("Task 1 In progress")
    print("Task 1 finished")
}

//print()

myQueue.async {
    print("Task 2 Started")
    print("Task 2 In progress")
    print("Task 2 finished")
}


// Concurrent Queue
// Concurrent Queue - this queue that can execute mutiple task simaentously but it will still follw order of starting the same way in which tasks are added

let concurrentQueue = DispatchQueue(label: "com.ba.AccessSpeciferPrj.concurrentQueue", attributes: .concurrent)
//Happens in parraelel (simatenously)
// the last one starts last in concurrentQueue
concurrentQueue.async {
    print("Task 1 Started")
    print("Task 1 In progress")
    print("Task 1 finished")
}
concurrentQueue.async {
    print( "Task 2 Started")
    print("Task 2 In progress")
    print("Task 2 finished")
}
concurrentQueue.async {
    print( "Task 3 Started")
    print("Task 3 In progress")
    print("Task 3 finished")
}

// default attribute is serial queue
let printQueue = DispatchQueue(label: "com.ba.AccessSpeciferPrj.printQueue")

printQueue.async {
    for i in 1...10 {
        print(i)
    }
    print("Task 1 finished")
}
printQueue.async {
    for i in 30...40 {
        print(i)
    }
    print("Task 2 finished")
}
printQueue.async {
    for i in 100...120 {
        print(i)
    }
    print("Task 3 finished")
}

concurrentQueue.async {
    for i in 1...10 {
        print(i)
    }
    print("CTask 1 finished")
}
concurrentQueue.async {
    for i in 30...40 {
        print(i)
    }
    print("CTask 2 finished")
}
concurrentQueue.async {
    for i in 100...120 {
        print(i)
    }
    print("CTask 3 finished")
}

