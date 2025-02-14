//
//  Facade.swift
//  DesignPatternIOS
//
//  Created by Rashad Milton on 2/12/25.
//
/*
    FacadeDesignPattern -
    - Structural design pattern
    - It provides simplified interfacte to complex subsystems
    - This acts as an intermeidary between client and complex subsystem, hiding all complexisity of system providing only certain useful access points
 
 */
import Foundation

class ShoppingCart{
    private let inventory = IntervotoryManagement()
    private let payment = PaymentManagement()
    private let shipment = ShipmentManagement()
    func checkout(items: [String], address: String, paymentMethod: String){
        guard inventory.checkAvaiability(item: items) else {
            print("Some items are not in stock")
            return
        }
        guard payment.processPayment(paymentMethod: paymentMethod) else {
            print("Payment processing failed")
            return
        }
        guard shipment.ship(items: items, to: address) else {
            print("Shipping failed")
            return
        }
        print("Order placed successfully")
    }
}

class IntervotoryManagement{
    func checkAvaiability(item: [String]) -> Bool {
        // things are in stock
        return true
    }
}

class PaymentManagement{
    func processPayment(paymentMethod: String) -> Bool {
        // logic for payment processing
        return true
    }
}
class ShipmentManagement{
    func ship(items:[String], to address: String) -> Bool{
        // this will manage the shipment to given address
        return true
    }
}
