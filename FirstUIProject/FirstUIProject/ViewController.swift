//
//  ViewController.swift
//  FirstUIProject
//
//  Created by Rashad Milton on 2/13/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpMyUI()
    }
    func setUpMyUI() {
        labelWelcome.text = "Hello, UI Development!"
        labelWelcome.textColor = .cyan
        
    }


}

