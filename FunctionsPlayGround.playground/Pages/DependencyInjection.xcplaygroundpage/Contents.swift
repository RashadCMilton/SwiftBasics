//: [Previous](@previous)

import Foundation

/*
    Dependency Injection - whatever the class or struct needs to perform the functionality, we should be able to pass it from hard coding, creating those object locallt
 
 1. Constructor Injection / Initilzer Injection
 2. Property Injection
 3. Method Injection
 */

class WebServiceManager{
    init (){
        print("Init for WebServiceManager")
    }
    func doAPICall(urlString: String) {
        print("API Call in Progress")
        print(urlString)
    }
    deinit{
        print("Deinit for WebServiceManager")
    }
}
class ViewController{
   // let webServiceManager: WebServiceManager = WebServiceManager() // better practice
    let webServiceManager: WebServiceManager;
    
    var apiUrl: String? // used for property injection
    
    
    // Best practice known as constructor injection
    init(webserviceManager: WebServiceManager) {
        self.webServiceManager = webserviceManager
        print("Init for View controller")
    }
    
    func sumbitButton(urlString: String){
    //    let webServiceManager = WebServiceManager() // Bad practice, should use DI
        webServiceManager.doAPICall(urlString: self.apiUrl ?? "")
    }
    deinit {
        print("Deinit for VC")
    }
}

let v1 = ViewController(webserviceManager:   WebServiceManager()) // This is constructor injection *This is Best*

v1.apiUrl = "https://google.com" // This is property injection, assign it before it is used, *main risk*
// property injection is useful when mutiple methods need the same member/paramater

v1.sumbitButton(urlString: v1.apiUrl ?? "") // method injection uses the paramater to pass into functionality

