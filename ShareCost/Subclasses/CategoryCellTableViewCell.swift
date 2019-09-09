//
//  CategoryCellTableViewCell.swift
//  ShareCost
//
//  Created by Wenbin Chen on 9/8/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class CategoryCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryButton: UIButton!
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor(red:0.62, green:0.78, blue:0.80, alpha:1.0) : .white
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
