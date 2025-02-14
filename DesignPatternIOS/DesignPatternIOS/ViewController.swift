//
//  ViewController.swift
//  DesignPatternIOS
//
//  Created by Rashad Milton on 2/11/25.
//
/*
    Design Pattenrs: Smaller classes, or modules, or sub functionality inside one project
    In one project we can have multiple design patterns being used
 
 Architecture Pattern - One for a whole project
 1. MVC
 2. MVVM
 3. MVVM-C
 4. Viper
 5. TCA - Composable Architecture
 
 Design Patterns
 1. Creational Design Pattern
 2. Structural Design Pattern
 3. Behaviroal Design Pattern
 
 1.  Creational Design Pattern (Object Creation) - it tells us how the objects are in your app
 1.  Singleton
 2.  FactoryDesignPattern / Factory Method
 3.  Builder
 4.  Prototype
 
 2. Structural Design pattern (How you code is structured)
 1. Adapter
 2. Decorator
 3. Facade
 
 3. Behaviroural Design Pattern (How your diffreent objects are cmmunicating with each other)
 1. Observer Pattern (Publisher Subscriber Pattern)
 2. Chain of Responsibilty
 3. Iterator
 4. ClosureDesignPatter ** Specific to IOS
 5. ProtocolDelegate ** Specific to IOS
 */

import UIKit
extension ViewController : NetworkData {
    func didReceiveDataFromAPI<T>(data: T) where T : Decodable {
        print(data)
    }
    
    func didFailWithError(error: any Error) {
        print(error.localizedDescription)
    }
    
   // var delegate: NetworkData?
    
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testPizzaBuilder()
        testFactory()
        testFacade()
        testAdapter()
        testClosureDesignPattern() // use closure to pass data from one class to another
        // Subscribing to the notifications
        NotificationCenter.default.addObserver(self, selector: #selector(handleMessage(_ :)), name: .newMessage, object: nil)
        //Protocol Delegate Pattern
        let apiClient = APIClient()
        if let apiURL = URL(string: "https://jsonplaceholder.typicode.com/todos") {
            apiClient.delegate = self // telling network manager to act it on myself
            apiClient.fetchDataFromAPIUsingProtocolDelegate(url: apiURL, modelType: Todo.self )
        }
        testProtocolDelegate()
    }
        
    // have to be compatible with OBJC in notificationcenter
    @objc
    func handleMessage(_ notification: Notification){
       if let userInfo = notification.userInfo, let message = userInfo["messageKey"] as? String {
            print("Chat Messages: \(message)")
           print()
        }
    }
    
    @IBAction func sendChatMessage (_ sender: Any) {
        let chatService = ChatService()
        chatService.sendMessage("Hello World")
        chatService.sendMessage("Hello World")
    }
    // Have to remove sub from publisher when not needed to stop memory crashes
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    func testSingleton () {
        let authManager = AuthManager.shared
        authManager.doLogin(token: "12345")
    }
    func testPizzaBuilder() {
        let pizza = PizzaBuilder()
            .setDough("Thin Crust")
            .setSauce("Marinara")
            .setToppings(["Pepperoni", "Mushrooms"])
            .build()

        print(pizza.description())
    }
    func testFactory() {
        let truck = VehicalFactory.createVehical(type: .car)
        truck.drive()
        truck.stop()
    }
    
    func testFacade() {
        let cart = ShoppingCart()
        cart.checkout(items: ["iphone", "airpods"], address: "123 Main Street", paymentMethod: "Apple Pay")
    }
    
    func testAdapter() {
        let anaytics = CustomAppAnaylticService()
        anaytics.logEvent(name: "Button Clicked", parameters:["email": "test@test.com", "userId": "123"])
        let firebaseAnalytics = FireBaseAnayliticAdapter()
        firebaseAnalytics.logEvent(name: "Button Clicked", parameters:["email": "test@test.com", "userId": "123"])
    }
    func testClosureDesignPattern() {
        let networkManager = MyNetworkManager()
        if let apiURL = URL(string: "https://jsonplaceholder.typicode.com/todos/1") {
            networkManager.loadDataFromAPI(url: apiURL, modelType: Todo.self) { (result) in
                
                switch result {
                case .success(let todo):
                    print(todo)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    func testProtocolDelegate() {
        let apiClient = APIClient()
        if let apiURL = URL(string: "https://jsonplaceholder.typicode.com/todos") {
            apiClient.fetchDataFromAPIUsingProtocolDelegate(url: apiURL, modelType: [Todo].self)
        }
    }
}

