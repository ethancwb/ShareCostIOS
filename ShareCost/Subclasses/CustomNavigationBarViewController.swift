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
        setupNormal()
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func setupTranslucent() {
        self.navigationBar.setBackgroundImage(UIImage.init(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage.init()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = UIColor.clear
        self.navigationBar.backgroundColor = UIColor.clear
    }
    
    func setupNormal() {
        let colorImage = getHeaderColor().image(self.navigationBar.frame.size)
        self.navigationBar.setBackgroundImage(colorImage, for: UIBarMetrics.default)
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = getHeaderColor()
        self.navigationBar.backgroundColor = getHeaderColor()
        self.navigationBar.shadowImage = UIImage.init()
        self.view.backgroundColor = getHeaderColor()
    }

}

extension UIColor {
    func image(_ size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
