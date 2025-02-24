//
//  ViewController.swift
//  LoginScreen
//
//  Created by Rashad Milton on 2/13/25.
//

import UIKit
import SwiftKeychainWrapper
import GoogleSignIn

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    private var viewModel = ViewModel()
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func googleSignInClicked(_ sender: Any) {
        guard let clientID = GIDSignIn.sharedInstance.configuration?.clientID else {
            print("Missing Client ID")
            return
        }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user,
            let idToken = user.idToken
            else {
                print("No user or id token")
                return
            }
            let email = user.profile?.email ?? "No email"
            let name = user.profile?.name ?? "No name"
            
            let saveSuccesful: Bool = KeychainWrapper.standard.set(idToken, forKey: "idToken")
            if saveSuccesful {
                print("Saved idToken to keychain")
            } else {
                print("Failed to save idToken to keychain")
            }
            print("User signed in: \(email), \(name), \(idToken)")
            let mainViewController = MainViewController()
            if let navigationController = self.navigationController {
                navigationController.pushViewController(mainViewController, animated: true)
            }
        }
    }
    
    @IBAction func SignInClicked(_ sender: Any) {
        print("Sign In Clicked: \(emailTextField.text) \(passwordTextField.text)")
        
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            viewModel.showAlert(view: self, message: "Please, fill in email and password")
            return
        }
        
        if !viewModel.isValidEmail(email) {
            viewModel.showAlert(view: self, message: "Please, enter a valid email")
            return
        }
        
        if !viewModel.isValidPassword(password) {
            viewModel.showAlert(view: self, message: "Please, enter a valid password")
            return
        }
        viewModel.authenticateUser(email: email, password: password)
        let mainViewController = TaskListViewController()
        if let navigationController = self.navigationController {
            navigationController.pushViewController(mainViewController, animated: true)
        }
        
    }
}

