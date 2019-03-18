//
//  CustomTextViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/17/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class CustomTextViewController: UITextView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        textContainerInset = UIEdgeInsets.zero
        textContainer.lineFragmentPadding = 0
    }
}
