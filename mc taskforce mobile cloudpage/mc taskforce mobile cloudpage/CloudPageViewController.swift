//
//  CloudPageViewController.swift
//  mc taskforce mobile cloudpage
//
//  Created by 楊野勇智 on 2016/01/17.
//  Copyright © 2016年 salesforce.com. All rights reserved.
//

import UIKit

class CloudPageViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var message : ETMessage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.delegate = self
        if (message != nil) {
            print("siteURL: \(message!.siteUrlAsString)")
            let request = NSURLRequest(URL: message!.siteURL())
            self.webView.loadRequest(request)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - UI WebView Delegat
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("\(error?.description)")
    }

}
