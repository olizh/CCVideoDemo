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
        // 先看看App的bundle里面有没有一个叫做demo.html的文件
        if let templatepath = Bundle.main.path(forResource: "demo", ofType: "html") {
            // 把链接的base设为FT中文网的网址，这个网址实际上不存在，但是不影响页面的加载
            let base = URL(string: "http://www.ftchinese.com/m/corp/demo.html")
            do {
                // 把demo.html从本地读取出来，然后用loadHTMLString的方法直接注入到webView
                // 这样测试起来比较方便，不需要改一个HTML文件然后上传到服务器
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

