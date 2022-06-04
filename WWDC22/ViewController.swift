//
//  ViewController.swift
//  Park WWDC
//
//  Created by Dylan McDonald on 6/4/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainWebView: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.overrideUserInterfaceStyle = .dark
        let link = URL(string:"https://events.apple.com/ms/xww6uj7woR0X9A3Z9K4JRk5VdHioJeacopALBwoa3Nf9qRbkXldY0xDczTPU29UduZhb5d3SyvZiIk_dEQnVOT8hg6UWOeeWdOTvn6LrOwSoH-I-IMl_UxSRCe7Ejgwy-X5BDmrCjVR7gy5OAvgtgGJaITngKdvAwIfhQMFvXho/overview")!
        let request = URLRequest(url: link)
        mainWebView.load(request)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        #if targetEnvironment(macCatalyst)
            updateTitleBar(withDelegate: WebViewToolbarDelegate(), withTitle: "Apple Event Website", withSubtitle: "", iconMode: .iconOnly, sender: self, session: (self.view.window?.windowScene?.session)!)
        #endif
        }
    }
    
    @IBAction func reload(_ sender: Any) {
        let link = URL(string:"https://www.nytimes.com/games/wordle/index.html")!
        let request = URLRequest(url: link)
        mainWebView.load(request)
    }
    
    @objc func reloadSite(_ sender: Any) {
        mainWebView.reload()
    }
    
    @objc func goHome(_ sender: Any) {
        let link = URL(string:"https://events.apple.com/ms/xww6uj7woR0X9A3Z9K4JRk5VdHioJeacopALBwoa3Nf9qRbkXldY0xDczTPU29UduZhb5d3SyvZiIk_dEQnVOT8hg6UWOeeWdOTvn6LrOwSoH-I-IMl_UxSRCe7Ejgwy-X5BDmrCjVR7gy5OAvgtgGJaITngKdvAwIfhQMFvXho/overview")!
        let request = URLRequest(url: link)
        mainWebView.load(request)
    }
    
}

