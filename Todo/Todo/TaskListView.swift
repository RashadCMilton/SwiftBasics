//
//  TaskListView.swift
//  Todo
//
//  Created by Rashad Milton on 2/12/25.
//
import Foundation
import SwiftUI

@main
struct TodoApp: App {
    var body: some Scene {
        WindowGroup {
            TaskListView()  // Set TaskListView as the root view
        }
    }
}

struct TaskListView: View {
    // Use AnyTask wrapper to store tasks
    @State private var tasks: [AnyTask] = [
        AnyTask(TaskFactory.createTask(type: "Work")),
        AnyTask(TaskFactory.createTask(type: "Personal"))
    ]
    
    var body: some View {
        NavigationView {
            List(tasks) { task in
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.headline)
                    Button("Complete") {
                        task.execute()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .onAppear {
                           print("Tasks loaded: \(tasks.count)")  // Check how many tasks are loaded
                       }
            .navigationTitle("Task Manager")
        }
    }
}

// Preview
struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
