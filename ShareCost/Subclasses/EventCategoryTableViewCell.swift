//
//  EventCategoryTableViewCell.swift
//  ShareCost
//
//  Created by Wenbin Chen on 9/11/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class EventCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryText: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
