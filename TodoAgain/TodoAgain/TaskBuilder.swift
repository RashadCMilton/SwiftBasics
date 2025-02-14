//
//  TaskBuilder.swift
//  TodoAgain
//
//  Created by Rashad Milton on 2/12/25.
//

import Foundation

protocol TaskBuilder {
    func setTitle(_ title: String) -> TaskBuilder
    func setPriority(_ priority: String) -> TaskBuilder
    func setDueDate(_ dueDate: Date?) -> TaskBuilder
    func build(type: String) -> AnyTask
}

class SimpleTaskBuilder: TaskBuilder {
    private var id: UUID = UUID()
    private var title: String = ""
    private var priority: String = "Low"
    private var dueDate: Date?
    
    init(title: String = "", priority: String = "", dueDate: Date? = nil) {
           self.title = title
           self.priority = priority
           self.dueDate = dueDate
       }
    
    func setTitle(_ title: String) -> TaskBuilder {
        self.title = title
        return self
    }
    
    func setPriority(_ priority: String) -> TaskBuilder {
        self.priority = priority
        return self
    }
    
    func setDueDate(_ dueDate: Date?) -> TaskBuilder {
        self.dueDate = dueDate
        return self
    }
    
    func build(type: String) -> AnyTask {
        let task = TaskFactory.createTask(type: type, title: title, priority: priority, dueDate: dueDate)
            return AnyTask(task)
        }
}

