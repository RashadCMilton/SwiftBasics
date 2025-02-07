//
//  ViewController.swift
//  AccessSpeciferProject
//
//  Created by Rashad Milton on 2/6/25.
//
/*
 Internal - this is default
 Private - this is the most restricted access specifier
 FilePrivate
 Public
 Open
 */
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelgate = AppDelegate()
    }
  
    func test() {
        let userProfile = UserProfile(name: "rashad", email: "test@ta.com")
        print("Testing")
        userProfile.updateName("Rashad")
        // userProfile.name = "Rashad"  this is now allowed because private
    }
    
   
   
    

}

