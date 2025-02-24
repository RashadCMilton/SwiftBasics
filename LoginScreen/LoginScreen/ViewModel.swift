//
//  ViewModel.swift
//  LoginScreen
//
//  Created by Rashad Milton on 2/19/25.
//

import Foundation
import UIKit
import SwiftKeychainWrapper

public class ViewModel: UIViewController {
    
    func showAlert(view: ViewController,message: String) {
        print("showing alert")
        let alert = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        view.present(alert, animated: true, completion: nil)
    }
    
    public func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    public func isValidPassword(_ password: String) -> Bool {
        
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPredicate.evaluate(with: password)
    }
    
    public func authenticateUser(email: String, password: String) {
        let userToken = UUID().uuidString
        let saveToken = KeychainWrapper.standard.set(userToken, forKey: "userToken")
        if saveToken {
            if let savedToken = KeychainWrapper.standard.string(forKey: "userToken") {
                print("Retrieved Token: \(savedToken)")
            } else {
                print("Failed to save token in KeyChain")
            }
        }
    }
}
