//
//  ViewController.swift
//  Swift WebView
//
//  Created by mac on 20/09/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var inputtedUrl = ""
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.insetsLayoutMarginsFromSafeArea = false
        // Do any additional setup after loading the view.
        
        print("viewDidLoad function")
        // create refresh button
        self.inputtedUrl = "https://teknologikartu.com"
        loadWebView()
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(self.webView.reload))
        
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
        
    }
    
    
    func loadWebView(){
        print("loadWebView function")
        if(!inputtedUrl.isEmpty){
            let url = URL(string: inputtedUrl)!
            webView.load(URLRequest(url: url))
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

}

