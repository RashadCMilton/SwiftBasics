//
//  ViewController.swift
//  LoginScreen
//
//  Created by Rashad Milton on 2/13/25.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    let swiftTopics = [
        ("Swift Overview", "https://developer.apple.com/swift/"),
        ("Swift Syntax", "https://developer.apple.com/documentation/swift/swift_standard_library"),
        ("Swift Guide", "https://developer.apple.com/library/archive/documentation/Swift/Conceptual/Swift_Programming_Language/"),
    ]
    
    let objcTopics = [
        ("Objective-C Overview", "https://developer.apple.com/documentation/objectivec"),
        ("Objective-C Runtime", "https://developer.apple.com/documentation/objectivec/objective_c_runtime"),
        ("Objective-C Guide", "https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjectiveC/Introduction/introobjc.html"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UICollectionView
        let layout = UICollectionViewFlowLayout()
       
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: collectionView.frame.width - 40, height: 100)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
   
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        self.view.addSubview(collectionView)
    }
    
    // MARK: - UICollectionView Data Source
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // One section for Swift, one for Objective-C
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? swiftTopics.count : objcTopics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let label = UILabel(frame: cell.contentView.bounds)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        // Set label text based on section
        let topic = indexPath.section == 0 ? swiftTopics[indexPath.row] : objcTopics[indexPath.row]
        label.text = topic.0
        
        cell.contentView.addSubview(label)
        return cell
    }
    
    // MARK: - UICollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let topic = indexPath.section == 0 ? swiftTopics[indexPath.row] : objcTopics[indexPath.row]
        
        if let url = URL(string: topic.1) {
            let webViewController = WebViewController(url: url)
            navigationController?.pushViewController(webViewController, animated: true)
        }
    }
}
