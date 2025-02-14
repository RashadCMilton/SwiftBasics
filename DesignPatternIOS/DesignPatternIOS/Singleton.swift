//
//  Singleton.swift
//  DesignPatternIOS
//
//  Created by Rashad Milton on 2/11/25.
//
/*\
    Singleton -
    It is a design pattern that ensures a class has only one instance which is global shared point of accesss
    Basic idea behind is to restrict multiple object creation
    This we can achieve by making init as private
 
    typical use case for singleon
 DatabaseManager
 Authetication Manager
 File Download Manager
 
 disadvantage
 -Globalstate
 - this object will stay in memory even if your task is done
 - Singleton are difficult to write test case
 - Tightcoupling
 - threadsafe
 */
import Foundation
// final keyword stops inheritance
final class AuthManager {
    // static allow for one global instance
    static let shared = AuthManager()
    private init () {}
    
    private var isLoggedIn: Bool = false
    var authToken = ""
    func doLogin(token: String) {
        self.authToken = token
        isLoggedIn = true
    }
    func logoOut() {
        isLoggedIn = false
        authToken = ""
    }
}
