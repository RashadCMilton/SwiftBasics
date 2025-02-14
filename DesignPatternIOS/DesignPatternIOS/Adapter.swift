//
//  Adapter.swift
//  DesignPatternIOS
//
//  Created by Rashad Milton on 2/12/25.
//
/*
    Adapter - this make two incompatible interfaces to work with each other. It acts as a bridge, translating request from one to desired input the other
 
    UIKITS and 3rd Party Library
 */

import Foundation


protocol AnaylticService {
    func logEvent(name: String, parameters: [String: Any]?)
}
class CustomAppAnaylticService: AnaylticService {
    func logEvent(name: String, parameters: [String: Any]?) {
        print("Custom App Anayltic Service Log Event: \(name), \(parameters ?? [:])")
    }
}
class FireBaseAnayliticAdapter: AnaylticService {
    func logEvent(name: String, parameters: [String: Any]?) {
        print("Custom App FireBase Anayltic Service Log Event: \(name), \(parameters ?? [:])")
    }
}
