//
//  Task.swift
//  Todo
//
//  Created by Rashad Milton on 2/12/25.
//
/*
    Factory Design Pattern
 */
import Foundation

// Task protocol with required properties and methods
protocol Task {
    var id: UUID { get }
    var title: String { get }
    func execute()
}

// Concrete Task types

class WorkTask: Task {
    let id = UUID()
    var title: String = "Work Task"
    
    func execute() {
        print("Executing work task.")
    }
}

class PersonalTask: Task {
    let id = UUID()
    var title: String = "Personal Task"
    
    func execute() {
        print("Executing personal task.")
    }
}
