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
        self.navigationBar.setBackgroundImage(UIImage.init(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage.init()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = UIColor.clear
        self.navigationBar.backgroundColor = UIColor.clear
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
