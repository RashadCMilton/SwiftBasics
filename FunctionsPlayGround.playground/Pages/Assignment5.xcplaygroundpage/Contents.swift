//: [Previous](@previous)

import Foundation
/* Codeable protocole allow for easy json decoding and coding
 */
struct User: Codable {
    let id: Int
    let name: String
    let email: String
  
}

class UserManager {
    var users: [User] = []
    init?(users: [User]) {
        if users.count == 0{
            print("Returning NIL to UserManager Instance")
            return nil
        }
        
        self.users = users
    }
    // convience init has to be options if init? is optional or error
    convenience init?() {
        // sets simple default user
        self.init(users: [User(id: 0, name: "Default User", email: "defaultuser@example.com")])
    }
    func printAllUsers() {
        users.forEach { print($0 ?? "No Users") }
    }
}
// Possible errors
enum APIError: Error {
    case invalidURL
    case APIResponseFailed
    case decodingFailed
    
}

func fetchUserData(urlString: String) async throws -> [User] {
    guard let url = URL(string: urlString) else {
        throw APIError.invalidURL
    }
    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as?  HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
            throw APIError.APIResponseFailed
        }
        do {
            return try JSONDecoder().decode([User].self, from: data) // .self refers to the type insteaf of instance
        } catch {
            throw APIError.decodingFailed
        }
    } catch {
        throw APIError.APIResponseFailed
    }
}
// have to use await in async programming as well as task
Task {
    do {
        let users = try await fetchUserData(urlString: "https://jsonplaceholder.typicode.com/users")
        users.forEach { print( "\($0.name)\n") }
        var highOrderOperations = users.sorted { $0.name > $1.name }
        highOrderOperations.forEach{print($0)}
        highOrderOperations = users.filter {$0.id > 2 && $0.name.contains("e")}
        print("Filter by ID > 02and name contains 'e':")
        
        highOrderOperations.forEach{print($0)}
        print("User Manager")
        let userManger = UserManager(users: users)
        userManger?.printAllUsers()
        
        print("Default User Manager")
        let defaultUserManager = UserManager()
        defaultUserManager?.printAllUsers()
        
        print("Nil User Manager")
        let nilUserManager = UserManager(users: [])
        print("NilUserManager is: \(nilUserManager)")
        
    } catch APIError.invalidURL {
        print("Invalid URL")
    } catch APIError.APIResponseFailed {
        print("API response failed")
    } catch APIError.decodingFailed {
        print("Error: failed to decode JSON")
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}


