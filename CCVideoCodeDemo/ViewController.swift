//
//  ViewController.swift
//  CCVideoCodeDemo
//
//  Created by ZhangOliver on 2017/1/13.
//  Copyright © 2017年 ZhangOliver. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    var webView: WKWebView = WKWebView()
    
    override func loadView() {
        super.loadView()
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        if let templatepath = Bundle.main.path(forResource: "demo", ofType: "html") {
            let base = URL(string: "http://www.ftchinese.com/m/corp/demo.html")
            do {
                let s = try NSString(contentsOfFile:templatepath, encoding:String.Encoding.utf8.rawValue)
                self.webView.loadHTMLString(s as String, baseURL:base)
            } catch {
                print ("Cannot load from local. Try load from the web! ")
            }
        } else {
            print ("the html file is not found in the bundle")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

