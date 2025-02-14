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
protocol Task: Identifiable {
    var id: UUID { get }
    var title: String { get }
    var priority: String { get }
    var dueDate: Date? { get }
    var completed: Bool { get set }
    mutating func  execute()
}

// Concrete Task types
struct APITask: Decodable {
    var id: Int
    var title: String
    var priority: String?
    var dueDate: Date?
}
struct WorkTask: Task, Identifiable {
    var completed: Bool = false
    
    var id: UUID = UUID()
    var title: String
    var priority: String
    var dueDate: Date?
    

    
    mutating func execute() {
        self.completed = true
        NotificationCenter.default.post(name: .taskUpdated, object: nil)
        print("Task updated notification sent for task: \(self.title)")
        print("Work task completed: \(title)")
    }
}

struct PersonalTask: Task, Identifiable {
    var completed: Bool = false
    
    var id: UUID = UUID()
    var title: String
    var priority: String
    var dueDate: Date?
    
    mutating func execute() {
        self.completed = true
        NotificationCenter.default.post(name: .taskUpdated, object: nil)
        print("Personal task completed: \(title)")
    }
}
