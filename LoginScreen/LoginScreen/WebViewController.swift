//
//  WebViewController.swift
//  LoginScreen
//
//  Created by Rashad Milton on 2/18/25.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var webView: WKWebView!
    var url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: self.view.bounds)
        self.view.addSubview(webView)
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
