//
//  TaskAdapter.swift
//  TodoAgain
//
//  Created by Rashad Milton on 2/12/25.
//

import Foundation
class TaskAdapter: Task {
    private let externalTask: ExternalTask
    
    var id: UUID {
        return UUID()  // Generate a new UUID for the task
    }
    
    var title: String {
        return externalTask.taskName
    }
    
    var priority: String {
        return externalTask.taskPriority
    }
    
    var dueDate: Date? {
        return externalTask.taskDueDate
    }
    
    var completed: Bool {
        get {
            return externalTask.isCompleted
        }
        set {
            externalTask.isCompleted = newValue
        }
    }
    
    init(externalTask: ExternalTask) {
        self.externalTask = externalTask
    }
    static func adapt(apiTask: APITask) -> AnyTask {
          let externalTask = ExternalTask(
              taskName: apiTask.title,
              taskPriority: apiTask.priority ?? "low",
              taskDueDate: apiTask.dueDate
          )
          
          let taskAdapter = TaskAdapter(externalTask: externalTask)
          return AnyTask(taskAdapter)
      }
    func execute() {
        externalTask.markAsCompleted()
        print("External Task completed: \(externalTask.taskName)")
    }
}
