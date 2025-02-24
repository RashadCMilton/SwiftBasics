//
//  APIViewModel.swift
//  SimpleAPICall
//
//  Created by Rashad Milton on 2/24/25.
//

import Foundation

class APIViewModel {
    static func parseData(result: Result<Data, Error>) -> [Country]{
        switch result{
        case .success(let data):
            print(data)
            let usersToReturn = try?  JSONDecoder().decode([Country].self , from: data)
            print(usersToReturn)
            return usersToReturn ?? []
        case .failure(let error):
            print(error.localizedDescription)
        }
        return []
    }
}
