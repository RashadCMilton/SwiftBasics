import Foundation

// Type-erased wrapper for Task that conforms to Task protocol
class AnyTask: Task, Identifiable {
    var completed: Bool
    let id: UUID
    let title: String
    let priority: String
    let dueDate: Date?
    private var _execute: () -> Void
    
    init<T: Task>(_ task: T) {
        self.id = task.id
        self.title = task.title
        self.priority = task.priority
        self.dueDate = task.dueDate
        self.completed = false
        self._execute = { }
        _execute = { [weak self] in
            var mutableTask = task
            mutableTask.execute()
            self?.completed = true
            NotificationCenter.default.post(name: .taskUpdated, object: self)  // Post notification

        }
    }
    
    func execute() {
        _execute()  // Perform the action
    }
}
