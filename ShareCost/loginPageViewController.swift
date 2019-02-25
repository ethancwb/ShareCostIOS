//
//  ViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 2/23/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit
import Foundation

class loginPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sendrequest(_ sender: Any) {
        getLoginFromString() { response in
            self.navigationItem.title = response
        }
    }
}

