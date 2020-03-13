//
//  DaweebViewController.swift
//  COVID-19KFAS
//
//  Created by Sw2x on 3/12/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit
import WebKit

class DaweebViewController: UIViewController , WKUIDelegate , WKNavigationDelegate  {

     var webView: WKWebView!
        

    
    override func viewDidLoad() {
        super.viewDidLoad()
         let webConfiguration = WKWebViewConfiguration()
              let screenSize: CGRect = UIScreen.main.bounds
              let myView = UIView(frame: CGRect(x: 0, y: 72, width: screenSize.width, height: screenSize.height-72))
              self.view.addSubview(myView)
              let preferences = WKPreferences()
              preferences.javaScriptEnabled = true
              webConfiguration.preferences = preferences
              webView = WKWebView(frame: myView.frame, configuration: webConfiguration)
               webView.uiDelegate = self
              webView.navigationDelegate = self
              view.addSubview(webView)
              
              let myURL = URL(string:"https://infographics.channelnewsasia.com/covid-19/map.html")
              let myRequest = URLRequest(url: myURL!)
              webView.load(myRequest)
              webView.allowsBackForwardNavigationGestures = true
        
    }
    
  

}
