//
//  TaskFactory.swift
//  Todo
//
//  Created by Rashad Milton on 2/12/25.
//
import Foundation
class TaskFactory {
    static func createTask(type: String, title: String, priority: String, dueDate: Date?) -> any Task {
        switch type {
        case "Work":
            return WorkTask(title: title, priority: priority, dueDate: dueDate)
        case "Personal":
            return PersonalTask(title: title, priority: priority, dueDate: dueDate)
        default:
            return WorkTask(title: title, priority: priority, dueDate: dueDate) // Default type
        }
    }
}


