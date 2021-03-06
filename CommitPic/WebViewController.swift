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
	loadAddressURL()
		
	}
	
	override func handle(_ url: URL) {
		targetURL = url
		super.handle(url)
		self.loadAddressURL()
	}
	
	func loadAddressURL() {
		guard let url = targetURL else {
			return
		}
		let req = URLRequest(url: url)
		self.webView.loadRequest(req)
	}
	
}

extension WebViewController: UIWebViewDelegate {
  func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    
    let urlString = request.url!.absoluteString
    let redirectUri = Constants.FIREBASEInfo.FIREBASE_CALLBACK_ADRESS
    if let _ =  urlString.range(of: "\(redirectUri)?code=") {
      print("URL \(request.url)")
      OAuthSwift.handle(url: request.url!)
      self.dismissWebViewController()
    }
    return true
  }}
