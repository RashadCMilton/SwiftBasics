//
//  ClosureDesignPattern.swift
//  DesignPatternIOS
//
//  Created by Rashad Milton on 2/12/25.
//
/*
    ClosureDesignPattern - use of closures for object or data transfer
 */
import Foundation

class MyNetworkManager{
    func loadDataFromAPI<T:Decodable>(url:URL, modelType:T.Type, completion:@escaping (Result<T, Error>)->Void) {
        print("Start of loadDataFromAPI method")
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            do{
                if let data = data { // raw bytes 
                   let recievedResponse = try JSONDecoder().decode(modelType, from: data)
                    completion(.success(recievedResponse))
                }
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
           
        }
        
        task.resume()
        print("End of loadDataFromAPI method")
    }
    
    
}
