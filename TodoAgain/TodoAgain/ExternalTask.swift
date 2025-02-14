//
//  ExternalTask.swift
//  TodoAgain
//
//  Created by Rashad Milton on 2/12/25.
//

import Foundation
class ExternalTask {
    var taskName: String
    var taskPriority: String
    var taskDueDate: Date?
    var isCompleted: Bool
    
    init(taskName: String, taskPriority: String, taskDueDate: Date?) {
        self.taskName = taskName
        self.taskPriority = taskPriority
        self.taskDueDate = taskDueDate
        self.isCompleted = false
    }
    
    func markAsCompleted() {
        isCompleted = true
    }
}
