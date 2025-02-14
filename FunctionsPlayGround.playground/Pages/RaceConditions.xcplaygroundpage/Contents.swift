import Foundation

/*
    Race Condition - This occurs when 2 or more threads access the shared resource simultaneously. That will lead to unwanted behavior or data corruption issues
 
 common scenarios
 1. multiple threads modifying the same variables
 2. concurrent access to shared resource like files or databases
 
 
 to Fix Race condition
 1. Actor
 2. Locks
 3. Semaphores
 4. Serial Queues
 */

class BankAccount {
    var balance: Int = 0
    
    func depositAmount(_ amount: Int) {
        balance += amount
    }
    func withdrawnAmount(_ amount: Int) {
        balance -= amount
    }
}

// simple example may now show race condition
let b1 = BankAccount()
DispatchQueue.global().async {
    b1.depositAmount(100) // thread 1
}
DispatchQueue.global().async {
    b1.withdrawnAmount(50) // thread 2
}
DispatchQueue.global().async {
    b1.depositAmount(50) // thread 3
}
print(b1.balance)

/*
 Actor - it is similar classes but it allows access to it variables one at a time, provide thread safety. and it does not have inheritance
 It is a refrences type, it will have initilzers, methods, and properties
 main advantage of this - it prevents data race condition
 
 Actor - by default supports async await concurrency
 */


/*
 Serial Queues can solve race conditions because they execute one at a time
 */

/*
   let myLock = NSLock()
    myLock.lock() // locks resource
    *Update Resources*
    myLock.unlock() // unlock resource
    ^^^ ensure one thread access resource at one time
 */

/*
    let semaphore = DispatchSemaphoe(value: 1) value of 1 means one can access value at time
    semaphore.wait() // wait if semaphore is not availble
    **Update Resource**
    semaphore.signal() // releasing the semaphore
 
 */


/*
    deadlock - this occurs when 2 or more threads are blocked forever because they are each waiting for resources that other threads holds. It is a circular dependency among the threads
    deadlock will make your app freeze/hang and can cause performance issue, it may result into app crash as well
 */

let queue1 = DispatchQueue(label:"queue1")
let queue2 = DispatchQueue(label:"queue2")

queue1.async {
    print("Hello Task 1 started")
    queue2.async {
        print("Hello Task 2 Started")
    }
    print("Task 1 finished")
}

queue2.async{
    print("Hello Task 2 started")
    queue1.async {
        print("Hello Task 1 Started")
    }
    print("Task 2 finished")
}
