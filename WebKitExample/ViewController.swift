//
//  ViewController.swift
//  WebKitExample
//
//  Created by Neeraj Prasher on 2019-07-17.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    
    @IBOutlet weak var webKit: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadFromURL()
        //self.loadFromFile()
    }
    
    func loadFromString(){
        let htmlStr = """
                            <h1>Hello World</h1>
                            <h2>Hello World</h2>
                            <h3>Hello World</h3>
                            <h4>Hello World</h4>
                            <h5>Hello World</h5>
                            <h6>Hello World</h6>
                      """
        webKit.loadHTMLString(htmlStr, baseURL: nil)
    }
    
    func loadFromURL(){
        let url = URL(string: "https://www.lambtoncollege.ca")
        let urlReq = URLRequest(url: url!)
        webKit.load(urlReq)
    }
    
    func loadFromFile(){
        let localfilepath = Bundle.main.url(forResource: "about", withExtension: "html")
        let myRequest = URLRequest(url: localfilepath!)
        webKit.load(myRequest)
    }
    
    @IBAction func webBrowserAction(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            webKit.reloadFromOrigin()
        case 1:
            if webKit.canGoForward{
                webKit.goForward()
            }
        case 2:
            if webKit.canGoBack{
                webKit.goBack()
            }
        case 3:
            webKit.reload()
        default:
            print("Nothing to do")
        }
    }
    
    
}

