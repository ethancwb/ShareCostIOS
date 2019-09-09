//
//  SegmentedControllerTableViewCell.swift
//  ShareCost
//
//  Created by Wenbin Chen on 9/8/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class SegmentedControllerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
