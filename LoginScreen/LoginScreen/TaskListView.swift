//
//  TaskListView.swift
//  LoginScreen
//
//  Created by Rashad Milton on 2/19/25.
//

import Foundation
import UIKit

struct Task: Decodable {
    let id = UUID()
    var title: String
    var completed: Bool
    var photo: Photo?
}
struct Photo: Codable {
    let id: String
    let author: String
    let download_url: String
    let width: Int
    let height: Int
    let url: String
}
extension UIImage {
    func resized(to targetSize: CGSize) -> UIImage {
        let size = self.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let scaleFactor = min(widthRatio, heightRatio)
        
        let newSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: newSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage!
    }
}


class TaskListViewController: UITableViewController {
    
    private var tasks: [Task] = []
    private var photos: [Photo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "To-Do List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddTaskAlert))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")
        fetchData()
        
    }
    func fetchData() {
        let group = DispatchGroup()
        group.enter()
        APIService.shared.fetchTodos { [weak self] tasks in
            if let tasks = tasks {
                self?.tasks = tasks
            }
        }
        group.leave()
        group.enter()
        APIService.shared.fetchPhotos{ [weak self] photos in
            if let photos = photos {
                self?.photos = photos
            }
            group.leave()
        }
        group.notify(queue: .main) {
            for i in 0..<self.tasks.count {
                        if i < self.photos.count {
                            self.tasks[i].photo = self.photos[i]  // Assign a photo
                        }
                    }
            self.tableView.reloadData()
        }
    }

    
    @objc private func showAddTaskAlert() {
        let alertController = UIAlertController(title: "Add New Task", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter task title"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            guard let title = alertController.textFields?.first?.text, !title.isEmpty else { return }
            let newTask = Task(title: title, completed: false)
            self.tasks.append(newTask)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    // MARK: - UITableView Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
   
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                let targetSize = CGSize(width: 100, height: 100)
                let resizedImage = image.resized(to: targetSize)

                DispatchQueue.main.async {
                    completion(resizedImage) // Use resizedImage, not the original image
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
        task.resume()
    }

    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        let task = tasks[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = task.completed ? "✓ \(task.title)" : task.title
        
        // Clear any previous image (important for cell reuse)
        content.image = UIImage(systemName: "photo")
        cell.contentConfiguration = content
        
        // Tag the cell to handle asynchronous image loading
        let cellTag = indexPath.row
        cell.tag = cellTag
        
        // Load image asynchronously
        if let photoURL = task.photo?.download_url, let url = URL(string: photoURL) {
            loadImage(from: url) { [weak self] image in
                guard let self = self else { return }
                
                // Only update if the cell hasn't been recycled for another row
                DispatchQueue.main.async {
                    if cell.tag == cellTag {
                        var updatedContent = cell.defaultContentConfiguration()
                        updatedContent.text = task.completed ? "✓ \(task.title)" : task.title
                        updatedContent.image = image
                        // Configure image properties for better display
                        updatedContent.imageProperties.cornerRadius = 10
                        updatedContent.imageProperties.maximumSize = CGSize(width: 60, height: 60)
                        cell.contentConfiguration = updatedContent
                    }
                }
            }
        }
        
        return cell
    }

    
    // MARK: - UITableView Delegate (Swipe Actions)
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "Complete") { _, _, completionHandler in
            self.tasks[indexPath.row].completed.toggle()
            tableView.reloadRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        completeAction.backgroundColor = .blue
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            self.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, completeAction])
    }
}
