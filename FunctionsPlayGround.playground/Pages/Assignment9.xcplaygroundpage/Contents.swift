import Foundation

// Sample API endpoints
let apiUrls = [
    URL(string: "https://jsonplaceholder.typicode.com/posts")!,
    URL(string: "https://jsonplaceholder.typicode.com/users")!,
    URL(string: "https://jsonplaceholder.typicode.com/comments")!
]

func fetchData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
    let task = URLSession.shared.dataTask(with: url, completionHandler: completion)
    task.resume()
}

func fetchDataConcurrently() {
    // Create a DispatchGroup to manage the concurrent tasks
    let dispatchGroup = DispatchGroup()

    // Store results in a dictionary to process after all requests complete
    var results = [Int: Data]()

    for (index, url) in apiUrls.enumerated() {
        dispatchGroup.enter() // Notify the group when a task starts
        print(index)
        // Fetch data from each API endpoint
        fetchData(from: url) { data, response, error in
            if let data = data {
                results[index] = data // Store the response data
            } else {
                print("Error fetching data from API \(index): \(String(describing: error))")
            }

            dispatchGroup.leave() // Notify the group that the task is done
        }
    }

    // Wait for all the requests to finish
    dispatchGroup.notify(queue: .main) {
        print("All API requests finished.")
        // Combine the results
        for (index, data) in results {
            print("\n Data from API \n \(index):  \(String(data: data, encoding: .utf8) ?? "")")
        }
    }
}

// Call the function to fetch data
fetchDataConcurrently()

// Keep the playground running to allow asynchronous tasks to complete
RunLoop.main.run()
