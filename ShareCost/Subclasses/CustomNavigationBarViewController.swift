//
//  CustomNavigationBarViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/2/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class CustomNavigationBarViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationBar.setBackgroundImage(UIImage.init(), for: UIBarMetrics.default)
//        self.navigationBar.shadowImage = UIImage.init()
//        self.navigationBar.isTranslucent = true
//        self.view.backgroundColor = UIColor.clear
//        self.navigationBar.backgroundColor = UIColor.clear
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = getHeaderColor()
        self.navigationBar.backgroundColor = getHeaderColor()
    }

}
