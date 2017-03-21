//
//  WebViewController.swift
//  CommitPic
//
//  Created by derrick on 2017. 3. 16..
//  Copyright © 2017년 Superbderrick. All rights reserved.
//
import OAuthSwift
import UIKit


class WebViewController: OAuthWebViewController {
  var targetURL: URL?
  let webView: UIWebView = UIWebView()

	override func viewDidLoad() {
		super.viewDidLoad()
    
    self.webView.frame = UIScreen.main.bounds
    self.webView.scalesPageToFit = true
    self.webView.delegate = self
    self.view.addSubview(self.webView)
		
	}
  
}

extension WebViewController: UIWebViewDelegate {
  func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    
    let urlString = request.url!.absoluteString
    let redirectUri = Constants.FIREBASEInfo.FIREBASE_CALLBACK_ADRESS
    if let _ =  urlString.range(of: "\(redirectUri)?code=") {
      OAuthSwift.handle(url: request.url!)
      self.dismissWebViewController()
    }
    return true
  }}
