//
//  TaskFactory.swift
//  Todo
//
//  Created by Rashad Milton on 2/12/25.
//

import Foundation
class TaskFactory {
    static func createTask(type: String) -> AnyTask {
        // Create the specific task based on the type provided
        let task: any Task
        switch type {
        case "Work":
            task = WorkTask()
        case "Personal":
            task = PersonalTask()
        default:
            fatalError("Unknown task type") // Handle unknown task types
        }

        return AnyTask(task) // Wrap in AnyTask for type erasure
    }
}
