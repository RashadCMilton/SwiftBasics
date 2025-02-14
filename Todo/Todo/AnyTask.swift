//
//  AnyTask.swift
//  Todo
//
//  Created by Rashad Milton on 2/12/25.
//

import Foundation

// Type-erased wrapper for Task that conforms to Task protocol
struct AnyTask: Task, Identifiable {
    let id: UUID
    let title: String
    private let executeBlock: () -> Void
    
    // Initialize with any Task type
    init<T: Task>(_ task: T) {
        self.id = task.id
        self.title = task.title
        self.executeBlock = task.execute
    }
    func execute() {
           executeBlock()
       }
}
