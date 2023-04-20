//
//  WebViewController.swift
//  Homework 6-Location Application
//
//  Created by Allie Lowery on 4/24/23.
//

import UIKit
import WebKit
import MessageUI

class WebViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    
    
    @IBOutlet weak var webView: WKWebView!
    
    
    @IBAction func sendSMS(_ sender: Any) {
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        composeVC.recipients = ["7245622206"]
        composeVC.body = "Hello. How can I assist You?"
        
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send messages.")
        }
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let myURL = URL(string:"https://disneyworld.disney.go.com/vacation-planning/?ef_id=CjwKCAjw0ZiiBhBKEiwA4PT9z9JOA8zFfCg5inYcCldkwPPwwKxoExfN1AbrkfgQzjzFdNxSccChNRoC0FwQAvD_BwE:G:s&s_kwcid=AL!5060!3!601103288317!e!!g!!disney%20world&CMP=KNC-FY23_WDW_TRA_DXF_W365_SCP_SCP_Gold%7CG%7C5231213.RR.AM.01.01%7CMYBUBPO%7CBR%7C601103288317&keyword_id=kwd-12193621%7Cdc%7Cdisney%20world%7C601103288317%7Ce%7C5060:3%7C&gclid=CjwKCAjw0ZiiBhBKEiwA4PT9z9JOA8zFfCg5inYcCldkwPPwwKxoExfN1AbrkfgQzjzFdNxSccChNRoC0FwQAvD_BwE")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        
    }
    

  

}
