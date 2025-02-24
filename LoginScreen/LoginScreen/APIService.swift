//
//  APIService.swift
//  LoginScreen
//
//  Created by Rashad Milton on 2/19/25.
//

import Foundation

class APIService {
    
    // Singleton instance
    static let shared = APIService()
    private init() {}
    
    // Fetch todos from JSONPlaceholder
    func fetchTodos(completion: @escaping ([Task]?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching todos: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            do {
                let todos = try JSONDecoder().decode([Task].self, from: data)
                completion(todos)
            } catch {
                print("Error decoding todos: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
    
   
    // Fetch random photos from Lorem Picsum
    func fetchPhotos(completion: @escaping ([Photo]?) -> Void) {
        // Lorem Picsum API for random images
        let urlString = "https://picsum.photos/v2/list"  
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching photos: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            if let jsonString = String(data: data, encoding: .utf8) {
                        print("Response Data: \(jsonString)")  // Debugging step
                    }
            do {
                let photos = try JSONDecoder().decode([Photo].self, from: data)
                print(photos)
                completion(photos)
            } catch {
                print("Error decoding photos: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
