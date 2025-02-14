//
//  Builder.swift
//  DesignPatternIOS
//
//  Created by Rashad Milton on 2/12/25.
//
/*
    Builder Design Pattern = It is a creational design pattern
    - it allows the construction on complex objects to be seperated in steps
    - this provides a way to create objects step by step, allowing the object creation more customized
 */
import Foundation
class Pizza{
    var dough: String = ""
    var sauce: String = ""
    var toppings: [String] = []
    
    
    func description() -> String{
        return "Dough: \(dough)\nSauce: \(sauce)\nToppings: \(toppings)\n"
    }
}

class PizzaBuilder{
    private var pizza: Pizza = Pizza()
    
    func setDough(_ dough: String) -> PizzaBuilder{
        self.pizza.dough = dough
        return self
    }
    
    func setSauce(_ sauce: String) -> PizzaBuilder{
        self.pizza.sauce = sauce
        return self
    }
    func setToppings(_ toppings: [String]) -> PizzaBuilder{
        self.pizza.toppings = toppings
        return self
    }
    
    func build() -> Pizza{
        return self.pizza
    }
}



















