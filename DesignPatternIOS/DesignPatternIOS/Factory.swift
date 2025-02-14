//
//  Factory.swift
//  DesignPatternIOS
//
//  Created by Rashad Milton on 2/12/25.
//
/*
    Factory Design Pattern
 - It is a creational design pattern
 - it provides an objection creation in super class, but allow subclass to alter the type of obj that will be created
 - Widely used in the Industry
 
 - Network Client Factory
 - UI Theme Factory
 - ViewController Factory
 */
import Foundation

protocol Vehical{
    var name: String { get }
    func drive()
    func stop()
}

class Car: Vehical{
    var name: String = "Truck"
    
    func drive() {
        print("Driving a Car")
    }
    
    func stop() {
        print("Car is stopped")
    }
}
class Bike: Vehical{
    var name: String = "Bike"
    func drive() {
        print("Driving a Bike")
    }
    
    func stop() {
        print("Bike is stopped")
    }
}
enum VehicalType{
    case car
    case bike
}
class VehicalFactory {
    static func createVehical(type: VehicalType) -> Vehical {
        switch type {
        case .car:
            let car: Car = Car()
            car.drive()
            return car
        case .bike:
            let bike = Bike()
            bike.drive()
            return Bike()
        }
    }
}
