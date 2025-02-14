//
//  TaskListView.swift
//  Todo
//
//  Created by Rashad Milton on 2/12/25.
//
import Foundation
import SwiftUI

struct TaskListView: View {
    @State private var taskManager = TaskManager(taskBuilder: SimpleTaskBuilder())
    @State private var tasks: [AnyTask] = []
    @State private var showAddTaskSheet = false  // Toggle for the sheet
    @State private var newTaskTitle = ""
    @State private var newTaskPriority = ""
    @State private var newTaskDueDate: Date? = nil
    
    private var taskDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }
    
    var body: some View {
        NavigationView {
            List(tasks) { task in
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.headline)
                        .strikethrough(task.completed)
                        .foregroundColor(task.completed ? .gray : .primary)
                    Text("Priority: \(task.priority)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    if let dueDate = task.dueDate {
                        Text("Due: \(dueDate, formatter: taskDateFormatter)")  // Formatting date
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Button("Complete") {
                        taskManager.completeTask(task: task)  // Using facade to complete task
                        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                            task.execute()
                            tasks[index] = task  // Update the task in the array
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Remove") {
                        taskManager.removeTask(task: task)  // Remove task using facade
                        
                        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                            tasks.remove(at: index)  // Remove the task from the list
                        }
                    }
                    .buttonStyle(.bordered)
                }
            }
            .onAppear {
                let externalTask1 = ExternalTask(taskName: "Old Work Task", taskPriority: "High", taskDueDate: Date())
                let externalTask2 = ExternalTask(taskName: "Old Personal Task", taskPriority: "Low", taskDueDate: nil)
                let adaptedTask1 = TaskAdapter(externalTask: externalTask1)
                let adaptedTask2 = TaskAdapter(externalTask: externalTask2)
                tasks = [
                    taskManager.createTask(title: "Work Task 1", type: "Work", priority: "High", dueDate: Date()),
                    taskManager.createTask(title: "Personal Task 2", type: "Personal", priority: "Low", dueDate: nil), AnyTask(adaptedTask1), AnyTask(adaptedTask2)
                ]
                APIService.shared.fetchTasks { fetchedTasks in
                    tasks.append(contentsOf: fetchedTasks)  // Append adapted tasks to the list
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: .taskUpdated)) { notification in
                if let updatedTask = notification.object as? AnyTask {
                    print("Notification received for task: \(updatedTask.title)")  // Debug print
                    // Handle the updated task
                }
            }
            .navigationTitle("Task Manager")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Task") {
                        showAddTaskSheet.toggle()  // Show the sheet to add a task
                    }
                }
            }
            // The sheet for adding a new task
            .sheet(isPresented: $showAddTaskSheet) {
                VStack {
                    Text("Add New Task")
                        .font(.headline)
                    
                    Form {
                        Section(header: Text("Task Details")) {
                            TextField("Title", text: $newTaskTitle)
                                .autocapitalization(.words)

                            TextField("Priority", text: $newTaskPriority)
                                .autocapitalization(.none)

                            DatePicker("Due Date", selection: Binding(
                                get: { newTaskDueDate ?? Date() },  // Provide default value if nil
                                set: { newTaskDueDate = $0 }        // Update the optional variable
                            ), displayedComponents: .date)
                            .labelsHidden()
                        }
                    }

                    
                    Button("Save Task") {
                        addNewTask()
                        showAddTaskSheet = false  // Dismiss the sheet after adding the task
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                .padding()
            }
        }
    }
    
    private func addNewTask() {
        guard !newTaskTitle.isEmpty, !newTaskPriority.isEmpty else { return }
        
        let newTask = taskManager.createTask(
            title: newTaskTitle,
            type: "Work",
            priority: newTaskPriority,
            dueDate: newTaskDueDate
        )
        
        tasks.append(newTask)
        
        // Reset the input fields
        newTaskTitle = ""
        newTaskPriority = ""
        newTaskDueDate = nil
    }
}

// Preview
struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
