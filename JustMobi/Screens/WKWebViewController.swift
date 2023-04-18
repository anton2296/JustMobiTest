//
//  WKWebViewController.swift
//  JustMobi
//
//  Created by Anton Khokhlov on 18.04.2023.
//

import WebKit

final class WKWebViewController: UIViewController, WKNavigationDelegate {
    let webView: WKWebView = WKWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = view.bounds;
        webView.navigationDelegate = self
        webView.scrollView.bounces = false
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.scrollView.showsHorizontalScrollIndicator = false
        webView.scrollView.isScrollEnabled = false
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(webView)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
