//
//  UserProfile.swift
//  AccessSpeciferProject
//
//  Created by Rashad Milton on 2/6/25.
//

import Foundation

class UserProfile {
    private var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    func updateName(_ newName: String) {
        self.name = newName
    }
    
    func isEmailValid() -> Bool {
        if email.contains("@") {
            return true;
        }
        return false;
    }
}
