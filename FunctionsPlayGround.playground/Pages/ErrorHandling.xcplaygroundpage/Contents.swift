//: [Previous](@previous)

import Foundation
// Ideal way of handling errors 1. Create enum with possible error
// 2. use throws keyword
// 3. then use do try catch ** try keyword before the method with a possible error
// Conforms to Error protocol
// Each case is a different error
enum DivisionError: Error {
    case divisionByZero
    case invalidInput
    
}

func division(num1:Double, num2:Double) throws -> Double {
    guard num2 != 0 else {
        throw DivisionError.divisionByZero // can throw enum case
    }
    return num1 / num2
}
// do try catch
do {
    let res = try division(num1: 10, num2: 0)
    print(res)
}
catch {
    print(error)
}

//2. try?
let res1 = try? division(num1: 10, num2: 0)
print(res1)


// 3. try!

//let res3 = try! division(num1: 10, num2: 0)
print(res3)

enum APIError:Error{
    case invalidURL
    case serverError(Int)
    case noDataFound
}
func fetchDataFromAPI(urlString:String, completionHandler: @escaping (Data?, APIError?) -> Void) {
    print("Start of api call")
    guard let url = URL(string:urlString)else{
        completionHandler(nil, APIError.invalidURL)
        return
    }
    
    let dataTask = URLSession.shared.dataTask(with: url) { data, urlresponse, error in
        
        if let error = error{
            completionHandler(nil, APIError.noDataFound)
            return
        }
        
        if let response = urlresponse as? HTTPURLResponse{
            if response.statusCode < 200 || response.statusCode > 299{
                completionHandler(nil, APIError.serverError(response.statusCode))
                return
            }
        }
        
        guard let receivedData = data else{
            completionHandler(nil,APIError.noDataFound)
            return
        }
        completionHandler(receivedData,nil)
    }
    dataTask.resume()
    print("End of api call")
}
    
fetchDataFromAPI(urlString: "https://dummyjson.com/products") { data, error in
    print("Got response")
    if let data = data{
        print(data.count)
    }else{
        print(error?.localizedDescription ?? "some error occured")
    }
    
}
