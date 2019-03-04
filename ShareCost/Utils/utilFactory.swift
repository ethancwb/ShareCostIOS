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
