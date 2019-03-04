//
//  CustomTextField.swift
//  ShareCost
//
//  Created by Wenbin Chen on 3/2/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var padding: UIEdgeInsets {
        get {
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
