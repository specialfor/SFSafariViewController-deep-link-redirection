//
//  ViewController.swift
//  DeepLinkCheburek
//
//  Created by Volodymyr Hryhoriev on 8/8/19.
//  Copyright © 2019 Volodymyr Hryhoriev. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: .didReceiveDeepLink, object: nil, queue: .main) { notification in
            self.dismiss(animated: true, completion: {
                self.performSegue(withIdentifier: "RedirectedScreen", sender: nil)
            })
        }
    }

    @IBAction private func openWebPage(_ sender: Any) {
        let url = URL(string: "http://localhost:8000/index.html")!
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion:  nil)
    }
}

extension Notification.Name {
    static let didReceiveDeepLink = Notification.Name("didReceiveDeepLink")
}

