//
//  ContentView.swift
//  SimpleAPICall
//
//  Created by Rashad Milton on 2/24/25.
//

import SwiftUI
import Foundation

struct User: Decodable, Identifiable {
    var id: Int
    var name: String
    var username: String
    var email: String
}
struct Country: Decodable, Identifiable {
    var id: String { code } // Using `code` as a unique identifier
    let capital: String
    let code: String
    let currency: Currency
    let flag: String
    let language: Language
    let name: String
    let region: String
}

struct Currency: Decodable {
    let code: String
    let name: String
    let symbol: String?
}

struct Language: Decodable {
    let code: String?
    let name: String?
}

struct ContentView: View {
    @State var Countries: [Country] = []
    @State private var searchText: String = ""
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return Countries
        }
        else {
            return Countries.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    var body: some View {
        VStack {
            TextField("Search Countries ...", text: $searchText).padding(10).cornerRadius(10)
            
        }
        VStack {
            List(filteredCountries){ country in
                VStack {
                    Text(country.name)
                }
                
            }.onAppear {
                APIService.shared.fetchData(url: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") { result in
                    Countries.append(contentsOf: APIViewModel.parseData(result: result))
                }
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
