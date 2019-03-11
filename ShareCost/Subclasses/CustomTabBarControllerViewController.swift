//
//  CustomTabBarControllerViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/9/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class CustomTabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBar.backgroundImage = UIImage.init()
//        self.tabBar.shadowImage = UIImage.init()
        self.tabBar.isTranslucent = false
        self.view.backgroundColor = UIColor.white
        self.tabBar.backgroundColor = UIColor.white
    }

}
