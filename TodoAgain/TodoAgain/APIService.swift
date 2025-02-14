//
//  APIService.swift
//  TodoAgain
//
//  Created by Rashad Milton on 2/13/25.
//

// APIService.swift
import Foundation

class APIService {
    
    static let shared = APIService() // Singleton to access the service globally
    
    private init() { }
    
    // Function to fetch tasks from the API
    func fetchTasks(completion: @escaping ([AnyTask]) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")! // Replace with your API endpoint
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching tasks: \(String(describing: error))")
                return
            }
            
            do {
                // Decode the API response into APITask objects
                let apiTasks = try JSONDecoder().decode([APITask].self, from: data)
                
                // Use the adapter to map the API tasks to AnyTask
                let tasks = apiTasks.map { task in
                    return TaskAdapter.adapt(apiTask: task) }
                
                // Return the tasks via the completion handler
                DispatchQueue.main.async {
                    completion(tasks)
                }
            } catch {
                print("Error decoding tasks: \(error)")
            }
        }
        
        task.resume()
    }
}
