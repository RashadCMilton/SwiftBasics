//: [Previous](@previous)

import Foundation

/*
    Await Async - Swift Concurerency
    this is availble from ios13 onwards, swift 5.5 in year 2019
 Structured concurrency
 Any function you can mark it with async keyword. What ever operators you initate gets executed in background thread. We can use await when calling the functiion
 Rules about async await
 1. Synchronous function cannot simply call async function directly (have to wrap in task block)
 2. Async functions can call async and sync functoions
 */

func apiCall() async  {
    
    print("Hello, World!")
    sleep(5)
    doSomething( )
}
Task {
    await apiCall()
    print("api call completed")
}

// can use DispatchQueue.main.async {} inside non aside async for async functionality
func doSomething() {
//    Task {
//        await apiCall()
//        print("api call completed")
//    }
    print("normal non async function")
}


// happens on background thread
func fetchWeatherData() async -> [Double] {
    return (1...100).map { _ in Double.random(in: 0...100) }
}
Task {
    let weatherData = await fetchWeatherData( )
    print(weatherData)
}

enum UserError: Error {
    case invalidUserCount
    case noData
}
// error handling with Async/Await
func fetchUsers(count: Int) async throws -> [String] {
    if count < 0 {
        throw UserError.invalidUserCount
    }
    return Array(["Adam", "Bob", "Charlie"])
}
// Since throwing error, need to use docatch and try await
Task {
    do {
        let users = try await fetchUsers(count: 5)
    } catch {
        print(error.localizedDescription)
    }
}

/*
    TaskGroup (new functionality) - This allow us to execute concurrent task ang await for there results. Useful for performing mutiple independent task that can be processed parrelly
 */
func gettingDataFromAPI(url: String) async -> String{
    try! await Task.sleep(for: .seconds(2))
    return "Data from \(url)"
}

func fetchDataFromMultipleURLs() async {
    try! await withTaskGroup(of: String.self) { group in
        let apis = ["https//example.com/ap1", "https//example.com/api2", "https//example.com/api3"]
        
        for url in apis {
            group.addTask {
                await gettingDataFromAPI(url: url)
            }
        }
        var outputsArray: [String] = []
        
        for await results in group {
            outputsArray.append(results)
        }
        print("Final data from all API: \(outputsArray)")
    }
}
Task {
    await fetchDataFromMultipleURLs()
}


func easyTaskGroup() async {
    await withTaskGroup(of: String.self) { group in
        group.addTask { "Task 1" }
        group.addTask { "Task 2" }
        group.addTask { "Task 3" }
        group.addTask { "Task 4" }
        
        for await result in group{
            print(result)
        }
    }
}






















