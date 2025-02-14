//
//  ProtocolDelegatePattern.swift
//  DesignPatternIOS
//
//  Created by Rashad Milton on 2/13/25.
//
/*
    Protocol Delegate - this is used to delegate certain responsibilty to another class/struct
    This will be done defining a protocol that specifies the methods or propertiess the delegate should return
 */
import Foundation

protocol NetworkData{
        func didReceiveDataFromAPI<T:Decodable>(data: T)
        func didFailWithError(error: Error)
}

class APIClient{
    var delegate: NetworkData? // delegate inside class
    func fetchDataFromAPIUsingProtocolDelegate<T:Decodable>(url:URL, modelType:T.Type) {
        print("Start of loadDataFromAPI method")
        let task = URLSession.shared.dataTask(with: url) { //[weak self]
            data, response, error in // use weak self when have refrences to object in closure
            do{
                if let data = data { // raw bytes
                   let recievedResponse = try JSONDecoder().decode(modelType, from: data)
                   // completion(.success(recievedResponse))
                    self.delegate?.didReceiveDataFromAPI(data: recievedResponse)
                }
            } catch {
                print(error.localizedDescription)
              //  completion(.failure(error))
                self.delegate?.didFailWithError(error: error)
            }
           
        }
        
        task.resume()
        print("End of loadDataFromAPI method")
    }
    
    
}

