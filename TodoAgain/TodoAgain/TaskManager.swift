//
//  TaskManager.swift
//  TodoAgain
//
//  Created by Rashad Milton on 2/13/25.
//

// TaskManager.swift
import Foundation

class TaskManager {
    private var taskBuilder: SimpleTaskBuilder
    private var tasks: [AnyTask] = []

    init(taskBuilder: SimpleTaskBuilder) {
        self.taskBuilder = taskBuilder
    }

    // Create and add a task
    func createTask(title: String, type: String, priority: String, dueDate: Date?) -> AnyTask {
        let task = taskBuilder
            .setTitle(title)
            .setPriority(priority)
            .setDueDate(dueDate)
            .build(type: type)
        
        tasks.append(task)
        return task
    }

    // Mark task as complete
    func completeTask(task: AnyTask) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            var updatedTask = tasks[index]
            updatedTask.execute()
            tasks[index] = updatedTask  // Update the task in the list
        }
    }

    // Get all tasks
    func getTasks() -> [AnyTask] {
        return tasks
    }

    // Remove task from list
    func removeTask(task: AnyTask) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
}
