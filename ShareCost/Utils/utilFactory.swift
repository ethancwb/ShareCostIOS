//
//  utilFactory.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/2/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import Foundation
import UIKit

func addBackground() -> UIImageView {
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    let imageViewBackground = UIImageView(frame: CGRect(x:0, y:0, width: width, height: height))
    imageViewBackground.image = UIImage(named: "login_image")
    
    // you can change the content mode:
    imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
    
    return imageViewBackground
}

func getHeaderColor() -> UIColor {
    return UIColor(red:0.56, green:0.75, blue:0.78, alpha:1.0)
}

func resizeImage(image: UIImage, toSize: CGSize) -> UIImage? {
    UIGraphicsBeginImageContext(toSize)
    image.draw(in: CGRect.init(x: 0, y: 0, width: toSize.width, height: toSize.height))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage
}

extension UIViewController
{
    func setupToHideKeyboardOnTapOnView()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
